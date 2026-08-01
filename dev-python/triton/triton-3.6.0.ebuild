# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{13..14} )
LLVM_COMPAT=( 22 )

inherit distutils-r1 llvm-r2 multiprocessing

DESCRIPTION="Triton language and compiler for deep learning primitives"
HOMEPAGE="https://github.com/triton-lang/triton"
SRC_URI="https://github.com/triton-lang/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-util/hip-6.3:=
"
DEPEND="
	${RDEPEND}
	$(llvm_gen_dep '
		llvm-core/llvm:${LLVM_SLOT}[llvm_targets_AMDGPU,llvm_targets_NVPTX]
		llvm-core/mlir:${LLVM_SLOT}
		llvm-core/lld:${LLVM_SLOT}
	')
	dev-cpp/nlohmann_json
"
BDEPEND="
	>=dev-build/cmake-3.20
	dev-build/ninja
	$(python_gen_cond_dep '
		>=dev-python/pybind11-2.13.1[${PYTHON_USEDEP}]
		>=dev-python/setuptools-40.8.0[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	distutils-r1_src_prepare

	# Don't build test libraries or dev binaries — they need static
	# MLIR/LLVM targets that aren't available with shared libMLIR.so
	sed -i '/add_subdirectory(test)/d; /add_subdirectory(bin)/d' CMakeLists.txt || die
	sed -i '/add_subdirectory(test)/d' third_party/amd/CMakeLists.txt || die
	sed -i '/add_subdirectory(test)/d' third_party/nvidia/CMakeLists.txt 2>/dev/null

	# Fix LLVM header path rename (llvm/Passes/ -> llvm/Plugins/ in LLVM 22)
	find . \( -name '*.cpp' -o -name '*.cc' -o -name '*.h' \) -exec \
		sed -i 's|llvm/Passes/PassPlugin\.h|llvm/Plugins/PassPlugin.h|g' {} +

	# Remove TargetOptions members dropped in LLVM 22
	# (UnsafeFPMath, NoInfsFPMath, NoNaNsFPMath moved to function attrs)
	sed -i '/opt\.UnsafeFPMath/d; /opt\.NoInfsFPMath/d; /opt\.NoNaNsFPMath/d' \
		python/src/llvm.cc || die

	# Fix RegionBranchPoint/RegionSuccessor API changes in MLIR 22
	# getRegionOrNull() removed; RegionSuccessor now needs the parent op
	sed -i \
		-e 's|src\.getRegionOrNull() == &getDefaultRegion()|!src.isParent()|' \
		-e 's|RegionSuccessor(getResults())|RegionSuccessor(getOperation(), getResults())|' \
		lib/Dialect/TritonGPU/IR/Ops.cpp || die

	# Don't treat deprecation warnings as errors — LLVM 22 deprecates
	# several APIs that triton still uses (OpBuilder::create, make_scope_exit)
	sed -i 's/-Werror/-Werror -Wno-error=deprecated-declarations/' \
		CMakeLists.txt || die

	# Gentoo builds LLVM/MLIR as shared libs (libLLVM.so, libMLIR.so).
	# Triton expects individual static MLIR/LLVM component targets that
	# don't exist. Create INTERFACE alias targets pointing to the dylibs.
	# Must be injected early (after include(AddMLIR)) so that all
	# add_subdirectory() calls can find these targets.
	cat > "${T}/gentoo-shared-libs.cmake" <<-'GENTOO_SHARED_LIBS'

	# Gentoo: create missing MLIR/LLVM component targets as aliases to shared libs
	foreach(_mlir_comp
	    MLIRAMDGPUDialect MLIRNVVMDialect MLIRNVVMToLLVMIRTranslation
	    MLIRGPUToNVVMTransforms MLIRGPUToGPURuntimeTransforms MLIRGPUTransforms
	    MLIRIR MLIRControlFlowToLLVM MLIRBytecodeWriter MLIRPass MLIRTransforms
	    MLIRLLVMDialect MLIRSupport MLIRTargetLLVMIRExport MLIRMathToLLVM
	    MLIRROCDLToLLVMIRTranslation MLIRGPUDialect MLIRSCFToControlFlow
	    MLIRIndexToLLVM MLIRGPUToROCDLTransforms MLIRUBToLLVM
	    MLIRAnalysis MLIRArithDialect MLIRMathDialect MLIRSCFDialect
	    MLIRArithToLLVM MLIRBuiltinToLLVMIRTranslation MLIRNVVMToLLVM
	    MLIRLLVMToLLVMIRTranslation MLIRReconcileUnrealizedCasts
	    MLIRTransformUtils MLIROptLib MLIRReduceLib MLIRLspServerLib
	    MLIRRegisterAllDialects MLIRRegisterAllPasses)
	  if(NOT TARGET ${_mlir_comp})
	    add_library(${_mlir_comp} INTERFACE IMPORTED)
	    target_link_libraries(${_mlir_comp} INTERFACE MLIR)
	  endif()
	endforeach()
	foreach(_llvm_comp
	    LLVMPasses LLVMNVPTXCodeGen LLVMAMDGPUCodeGen LLVMAMDGPUAsmParser
	    LLVMX86CodeGen LLVMX86AsmParser LLVMAnalysis LLVMCore LLVMSupport
	    LLVMOption LLVMCodeGen LLVMTransformUtils)
	  if(NOT TARGET ${_llvm_comp})
	    add_library(${_llvm_comp} INTERFACE IMPORTED)
	    target_link_libraries(${_llvm_comp} INTERFACE LLVM)
	  endif()
	endforeach()
	GENTOO_SHARED_LIBS
	sed -i '/include(AddMLIR)/r '"${T}/gentoo-shared-libs.cmake" \
		CMakeLists.txt || die

	# --- AMD backend fixes for MLIR 22 ---

	# Fix visitRegionSuccessors signature
	# (parameter changed from RegionBranchPoint to RegionSuccessor)
	sed -i 's/RegionBranchPoint successor/RegionSuccessor successor/' \
		third_party/amd/include/Analysis/RangeAnalysis.h \
		third_party/amd/lib/Analysis/RangeAnalysis.cpp || die

	# Fix RegionSuccessor constructor (now requires parent operation)
	sed -i 's|RegionSuccessor(branch->getResults().slice(|RegionSuccessor(branch.getOperation(), branch->getResults().slice(|' \
		third_party/amd/lib/Analysis/RangeAnalysis.cpp || die

	# --- NVIDIA backend fixes for MLIR 22 ---

	# CpAsyncMBarrierArriveSharedOp renamed to CpAsyncMBarrierArriveOp
	sed -i 's/CpAsyncMBarrierArriveSharedOp/CpAsyncMBarrierArriveOp/g' \
		third_party/nvidia/lib/TritonNVIDIAGPUToLLVM/LoadStoreOpToLLVM.cpp || die

	# BarrierOp::create signature changed — now needs TypeRange + all optional args
	sed -i 's|NVVM::BarrierOp::create(b, b.getLoc(), b.i32_val(barIdx),|NVVM::BarrierOp::create(b, b.getLoc(), mlir::TypeRange{}, b.i32_val(barIdx),|' \
		third_party/nvidia/lib/TritonNVIDIAGPUToLLVM/ConvertWarpSpecializeToLLVM.cpp || die
	sed -i 's|b.i32_val(numThreads));|b.i32_val(numThreads), mlir::NVVM::BarrierReductionAttr{}, mlir::Value{});|' \
		third_party/nvidia/lib/TritonNVIDIAGPUToLLVM/ConvertWarpSpecializeToLLVM.cpp || die

	# TaskIdBackwardPropagation needs visitNonControlFlowArguments override
	# (new pure virtual in MLIR 22's AbstractSparseBackwardDataFlowAnalysis)
	sed -i '/void setToExitState(TaskIdLattice \*lattice) override;/a\\n  void visitNonControlFlowArguments(RegionSuccessor \&successor,\n                                   ArrayRef<BlockArgument> arguments) override {}' \
		third_party/nvidia/hopper/lib/Transforms/WarpSpecialization/TaskIdPropagation.h || die

	# --- LLVM 22 float semantics fixup for AMD backend ---
	# LLVM 22 changed ConstantOp::verify() to check float attribute semantics
	# identity (pointer comparison on fltSemantics) instead of just bit width.
	# This catches a latent bf16/f16 type mismatch (both 16-bit) in Triton's
	# LLVM lowering that was invisible to LLVM <=21 (which only checked width).
	# Fix: after applyPartialConversion, walk all LLVM::ConstantOp and replace
	# any where the FloatAttr type differs from the result type.
	cat > "${T}/llvm22-float-semantics-fixup.cpp" <<-'FLOAT_FIXUP'
	    // LLVM 22 float semantics fixup: LLVM 22 checks float attribute
	    // semantics identity (pointer comparison), not just bit width.
	    // Fix any ConstantOp where the FloatAttr type differs from the
	    // result type (e.g. bf16 attr on f16 result or vice versa).
	    {
	      SmallVector<LLVM::ConstantOp> opsToFix;
	      mod.walk([&](LLVM::ConstantOp op) {
	        auto floatAttr = dyn_cast<FloatAttr>(op.getValue());
	        if (!floatAttr)
	          return;
	        auto resultType = dyn_cast<FloatType>(op.getType());
	        if (!resultType)
	          return;
	        if (floatAttr.getType() != resultType)
	          opsToFix.push_back(op);
	      });
	      for (auto op : opsToFix) {
	        auto floatAttr = cast<FloatAttr>(op.getValue());
	        auto resultType = cast<FloatType>(op.getType());
	        APFloat val = floatAttr.getValue();
	        bool losesInfo;
	        val.convert(resultType.getFloatSemantics(),
	                    APFloat::rmNearestTiesToEven, &losesInfo);
	        OpBuilder b(op);
	        auto fixed = LLVM::ConstantOp::create(
	            b, op.getLoc(), FloatAttr::get(resultType, val));
	        op->getResult(0).replaceAllUsesWith(fixed->getResult(0));
	        op->erase();
	      }
	    }
	FLOAT_FIXUP
	sed -i "/fixUpLoopAnnotation/r ${T}/llvm22-float-semantics-fixup.cpp" \
		third_party/amd/lib/TritonAMDGPUToLLVM/TritonGPUToLLVM.cpp || die
}

pkg_setup() {
	llvm-r2_pkg_setup
	python-single-r1_pkg_setup
}

python_compile() {
	local llvm_prefix="$(get_llvm_prefix)"

	# Use system LLVM/MLIR — don't download anything
	export LLVM_SYSPATH="${llvm_prefix}"
	export TRITON_OFFLINE_BUILD=1

	# Use system nlohmann/json
	export JSON_SYSPATH="${EPREFIX}/usr"

	# Use system pybind11
	export PYBIND11_SYSPATH="$(python_get_sitedir)/pybind11"

	# Parallel build
	export MAX_JOBS="$(makeopts_jobs)"

	# Disable Proton profiler (needs cuda.h/cupti.h)
	export TRITON_BUILD_PROTON=OFF

	# Tell cmake where to find MLIR and LLD configs
	local llvm_libdir="${llvm_prefix}/$(get_libdir)"
	export TRITON_APPEND_CMAKE_ARGS="\
		-DMLIR_DIR=${llvm_libdir}/cmake/mlir \
		-DLLD_DIR=${llvm_libdir}/cmake/lld \
		-DLLVM_LIBRARY_DIR=${llvm_libdir} \
		-DTRITON_BUILD_UT=OFF \
		-DLLVM_ENABLE_WERROR=OFF \
		-DMLIR_LINK_MLIR_DYLIB=ON"

	distutils-r1_python_compile
}
