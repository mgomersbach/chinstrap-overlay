# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_14 )
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_EXT=1
ROCM_VERSION=6.1
inherit distutils-r1 multiprocessing rocm systemd

# Bundled C++ dependencies fetched by CMake FetchContent at build time.
# Pre-download them here so the build works inside network-sandbox.
CUTLASS_PV="4.7.1"
FLASH_ATTN_COMMIT="9cd61de38763d712bb6ce56e2a02cc2bf718c89f"
FLASHMLA_COMMIT="0eee43b12f034b657133cf2afca6a72ebb6efccf"
QUTLASS_COMMIT="e74319e3405ce6d71965732880f5dc1f52371f64"
DEEPGEMM_COMMIT="1e1842a833699298f7afc02eefb2ed168fff6938"
DEEPSELECT_COMMIT="d96d33afe1fab0d6066da49cdc91e64c2bee65ea"
FLASH_KDA_COMMIT="17a037d98da546deb4591e967cf961a43c034d8b"
FMHA_SM100_COMMIT="968061ab16cb14991a5c7d4c0e8eabf531be0dcf"
TML_FA4_COMMIT="75765e76a9c2c012c1f6ecd64577eb646eb4d303"
TRITON_PV="3.5.1"

# Git submodules of the bundled projects above; GitHub archives leave
# them empty. Each pins its own CUTLASS revision.
FLASH_ATTN_CUTLASS_COMMIT="62750a2b75c802660e4894434dc55e839f322277"
FLASHMLA_CUTLASS_COMMIT="147f5673d0c1c3dcf66f78d677fd647e4a020219"
DEEPGEMM_CUTLASS_COMMIT="f3fde58372d33e9a5650ba7b80fc48b3b49d40c8"
DEEPGEMM_DEEPJIT_COMMIT="3732a3b9a0a2e5126396908a362ba5abdf043b2f"
DEEPSELECT_CUTLASS_COMMIT="ae6bccf341fb4410241f696ba06873023d5ce4ed"
FLASH_KDA_CUTLASS_COMMIT="5c149f52a436782210263fb2f19b354443a61c6a"
FMHA_SM100_CUTLASS_COMMIT="098de2a652cf8f00fd70b2df54051c7eccbb855a"

DESCRIPTION="A high-throughput and memory-efficient inference and serving engine for LLMs"
HOMEPAGE="https://github.com/vllm-project/vllm https://docs.vllm.ai/"
SRC_URI="
	https://github.com/vllm-project/${PN}/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.tar.gz
	cuda? (
		https://github.com/NVIDIA/cutlass/archive/refs/tags/v${CUTLASS_PV}.tar.gz
			-> cutlass-${CUTLASS_PV}.tar.gz
		https://github.com/vllm-project/flash-attention/archive/${FLASH_ATTN_COMMIT}.tar.gz
			-> vllm-flash-attention-${FLASH_ATTN_COMMIT}.tar.gz
		https://github.com/vllm-project/FlashMLA/archive/${FLASHMLA_COMMIT}.tar.gz
			-> FlashMLA-${FLASHMLA_COMMIT}.tar.gz
		https://github.com/IST-DASLab/qutlass/archive/${QUTLASS_COMMIT}.tar.gz
			-> qutlass-${QUTLASS_COMMIT}.tar.gz
		https://github.com/vllm-project/DeepGEMM/archive/${DEEPGEMM_COMMIT}.tar.gz
			-> vllm-DeepGEMM-${DEEPGEMM_COMMIT}.tar.gz
		https://github.com/deepseek-ai/DeepJIT/archive/${DEEPGEMM_DEEPJIT_COMMIT}.tar.gz
			-> DeepJIT-${DEEPGEMM_DEEPJIT_COMMIT}.tar.gz
		https://github.com/vllm-project/DeepSelect/archive/${DEEPSELECT_COMMIT}.tar.gz
			-> DeepSelect-${DEEPSELECT_COMMIT}.tar.gz
		https://github.com/vllm-project/FlashKDA/archive/${FLASH_KDA_COMMIT}.tar.gz
			-> FlashKDA-${FLASH_KDA_COMMIT}.tar.gz
		https://github.com/vllm-project/MSA/archive/${FMHA_SM100_COMMIT}.tar.gz
			-> MSA-${FMHA_SM100_COMMIT}.tar.gz
		https://github.com/vllm-project/tml-fa4/archive/${TML_FA4_COMMIT}.tar.gz
			-> tml-fa4-${TML_FA4_COMMIT}.tar.gz
		https://github.com/triton-lang/triton/archive/refs/tags/v${TRITON_PV}.tar.gz
			-> triton-${TRITON_PV}.tar.gz
	)
"
for _vllm_cutlass in \
	${FLASH_ATTN_CUTLASS_COMMIT} ${FLASHMLA_CUTLASS_COMMIT} \
	${DEEPGEMM_CUTLASS_COMMIT} ${DEEPSELECT_CUTLASS_COMMIT} \
	${FLASH_KDA_CUTLASS_COMMIT} ${FMHA_SM100_CUTLASS_COMMIT}
do
	SRC_URI+="
		cuda? (
			https://github.com/NVIDIA/cutlass/archive/${_vllm_cutlass}.tar.gz
				-> cutlass-${_vllm_cutlass}.tar.gz
		)
	"
done
unset _vllm_cutlass

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda grpc rocm"
RESTRICT="test"

REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
	?? ( cuda rocm )
	rocm? (
		|| ( ${ROCM_REQUIRED_USE} )
	)
"

# -- Core runtime dependencies (always needed) --
# Floors follow requirements/common.txt. Upstream also caps
# fastapi<0.137 and pins lark==1.2.2; ::gentoo carries neither, so those
# stay uncapped.
RDEPEND="
	${PYTHON_DEPS}
	acct-group/vllm
	acct-user/vllm
	dev-build/ninja

	$(python_gen_cond_dep '
		>=dev-python/aiohttp-3.14.3[${PYTHON_USEDEP}]
		>=dev-python/anthropic-0.71.0[${PYTHON_USEDEP}]
		dev-python/blake3[${PYTHON_USEDEP}]
		dev-python/cachetools[${PYTHON_USEDEP}]
		dev-python/cbor2[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		=dev-python/depyf-0.20.0*[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.20.3[${PYTHON_USEDEP}]
		dev-python/ijson[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-4.23.0[${PYTHON_USEDEP}]
		dev-python/lark[${PYTHON_USEDEP}]
		>=dev-python/llguidance-1.7.0[${PYTHON_USEDEP}]
		<dev-python/llguidance-1.8[${PYTHON_USEDEP}]
		=dev-python/lm-format-enforcer-0.11.3*[${PYTHON_USEDEP}]
		>=dev-python/mcp-2.0.0[${PYTHON_USEDEP}]
		<dev-python/mcp-3[${PYTHON_USEDEP}]
		>=dev-python/mistral-common-1.11.6[${PYTHON_USEDEP}]
		>=dev-python/model-hosting-container-standards-0.1.14[${PYTHON_USEDEP}]
		<dev-python/model-hosting-container-standards-1[${PYTHON_USEDEP}]
		dev-python/msgspec[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/openai-2.25.0[${PYTHON_USEDEP}]
		<dev-python/openai-3[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-api-1.27.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-1.27.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-sdk-1.27.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-semantic-conventions-ai-0.4.1[${PYTHON_USEDEP}]
		>=dev-python/oss-harmony-0.0.11[${PYTHON_USEDEP}]
		=dev-python/outlines-core-0.2.14*[${PYTHON_USEDEP}]
		dev-python/partial-json-parser[${PYTHON_USEDEP}]
		>=dev-python/pillow-12.3.0[${PYTHON_USEDEP}]
		>=dev-python/prometheus-client-0.18.0[${PYTHON_USEDEP}]
		>=dev-python/prometheus-fastapi-instrumentator-8.0.0[${PYTHON_USEDEP}]
		>=dev-python/protobuf-5.29.6[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/py-cpuinfo[${PYTHON_USEDEP}]
		dev-python/pybase64[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.12.0[${PYTHON_USEDEP}]
		dev-python/python-json-logger[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		>=dev-python/pyzmq-25.0.0[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		>=dev-python/requests-2.33.0[${PYTHON_USEDEP}]
		dev-python/setproctitle[${PYTHON_USEDEP}]
		>=dev-python/setuptools-78.1.1[${PYTHON_USEDEP}]
		>=dev-python/six-1.16.0[${PYTHON_USEDEP}]
		>=dev-python/starlette-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.6.0[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.10[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/uvloop[${PYTHON_USEDEP}]
		dev-python/watchfiles[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.13.0[python,${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.6.2[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[${PYTHON_USEDEP}]
		>=sci-ml/tokenizers-0.23.2[${PYTHON_USEDEP}]
	')

	=dev-python/compressed-tensors-0.17.0*[${PYTHON_SINGLE_USEDEP}]
	=dev-python/xgrammar-0.2.8*[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-1.31.0[${PYTHON_SINGLE_USEDEP}]
	=sci-ml/pytorch-2.13*[${PYTHON_SINGLE_USEDEP},cuda?,rocm?]
	>=sci-ml/transformers-5.16.1[${PYTHON_SINGLE_USEDEP}]
	<sci-ml/transformers-5.20[${PYTHON_SINGLE_USEDEP}]

	grpc? (
		$(python_gen_cond_dep '
			dev-python/grpcio[${PYTHON_USEDEP}]
			dev-python/grpcio-reflection[${PYTHON_USEDEP}]
		')
	)

	cuda? (
		=sci-ml/torchaudio-2.11*[${PYTHON_SINGLE_USEDEP}]
		=sci-ml/torchvision-0.28*[${PYTHON_SINGLE_USEDEP},cuda]
		$(python_gen_cond_dep '
			=dev-python/numba-0.65*[${PYTHON_USEDEP}]
		')
	)
	rocm? (
		=sci-ml/torchvision-0.28*[${PYTHON_SINGLE_USEDEP},rocm]
		dev-python/triton[${PYTHON_SINGLE_USEDEP}]
		dev-python/triton-kernels[${PYTHON_SINGLE_USEDEP}]
		dev-util/amdsmi
		$(python_gen_cond_dep '
			=dev-python/conch-triton-kernels-1.2.1*[${PYTHON_USEDEP}]
			=dev-python/numba-0.65*[${PYTHON_USEDEP}]
		')
	)
"

DEPEND="${RDEPEND}"

BDEPEND="
	>=dev-build/cmake-3.26.1
	dev-build/ninja
	$(python_gen_cond_dep '
		>=dev-python/setuptools-78.1.1[${PYTHON_USEDEP}]
		>=dev-python/setuptools-scm-8[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
		>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	')
	grpc? (
		$(python_gen_cond_dep '
			dev-python/grpcio-tools[${PYTHON_USEDEP}]
		')
	)
	cuda? (
		dev-util/nvidia-cuda-toolkit
	)
	rocm? (
		>=dev-util/hip-6.3:=
		<dev-util/hip-7.3:=
	)
"

PATCHES=(
	"${FILESDIR}/${P}-no-rust-frontend.patch"
)

_vllm_submodule() {
	local dest=${WORKDIR}/${1} src=${WORKDIR}/${2}
	rm -rf "${dest}" || die
	mv "${src}" "${dest}" || die
}

src_unpack() {
	default

	if use cuda; then
		_vllm_submodule flash-attention-${FLASH_ATTN_COMMIT}/csrc/cutlass \
			cutlass-${FLASH_ATTN_CUTLASS_COMMIT}
		_vllm_submodule FlashMLA-${FLASHMLA_COMMIT}/csrc/cutlass \
			cutlass-${FLASHMLA_CUTLASS_COMMIT}
		_vllm_submodule DeepGEMM-${DEEPGEMM_COMMIT}/third-party/cutlass \
			cutlass-${DEEPGEMM_CUTLASS_COMMIT}
		_vllm_submodule DeepGEMM-${DEEPGEMM_COMMIT}/third-party/deep_jit \
			DeepJIT-${DEEPGEMM_DEEPJIT_COMMIT}
		_vllm_submodule DeepSelect-${DEEPSELECT_COMMIT}/csrc/3rdparty/cutlass \
			cutlass-${DEEPSELECT_CUTLASS_COMMIT}
		_vllm_submodule FlashKDA-${FLASH_KDA_COMMIT}/cutlass \
			cutlass-${FLASH_KDA_CUTLASS_COMMIT}
		_vllm_submodule MSA-${FMHA_SM100_COMMIT}/python/fmha_sm100/cutlass \
			cutlass-${FMHA_SM100_CUTLASS_COMMIT}
	fi
}

src_prepare() {
	if use rocm; then
		# Fix hardcoded /opt/rocm paths to use system ROCm
		sed -e "s|/opt/rocm|${EPREFIX}/usr|g" \
			-i CMakeLists.txt || die

		# Skip vendoring triton_kernels for HIP — the system
		# dev-python/triton-kernels package provides it instead
		# (vllm/utils/import_utils.py prefers the site-packages copy).
		# 1) Replace FetchContent include with a no-op cmake target
		sed -i '/include(cmake\/external_projects\/triton_kernels.cmake)/c\    add_custom_target(triton_kernels)' \
			CMakeLists.txt || die
		# 2) Skip post-build copytree of triton_kernels in setup.py
		#    (only change the first occurrence of _is_cuda() or _is_hip())
		sed -i '0,/_is_cuda() or _is_hip()/{s/_is_cuda() or _is_hip()/_is_cuda()/}' \
			setup.py || die
	fi
	distutils-r1_src_prepare
}

python_compile() {
	# Tell setuptools-scm the version (no .git in tarball)
	export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"

	# Do not download precompiled wheels
	unset VLLM_USE_PRECOMPILED

	# Parallel build jobs
	export MAX_JOBS="$(makeopts_jobs)"

	# Set target device
	if use cuda; then
		export VLLM_TARGET_DEVICE="cuda"

		# Point build at pre-downloaded C++ dependencies
		export VLLM_CUTLASS_SRC_DIR="${WORKDIR}/cutlass-${CUTLASS_PV}"
		export VLLM_FLASH_ATTN_SRC_DIR="${WORKDIR}/flash-attention-${FLASH_ATTN_COMMIT}"
		export FLASH_MLA_SRC_DIR="${WORKDIR}/FlashMLA-${FLASHMLA_COMMIT}"
		export QUTLASS_SRC_DIR="${WORKDIR}/qutlass-${QUTLASS_COMMIT}"
		export DEEPGEMM_SRC_DIR="${WORKDIR}/DeepGEMM-${DEEPGEMM_COMMIT}"
		export DEEPSELECT_SRC_DIR="${WORKDIR}/DeepSelect-${DEEPSELECT_COMMIT}"
		export FLASH_KDA_SRC_DIR="${WORKDIR}/FlashKDA-${FLASH_KDA_COMMIT}"
		export FMHA_SM100_SRC_DIR="${WORKDIR}/MSA-${FMHA_SM100_COMMIT}"
		export TML_FA4_SRC_DIR="${WORKDIR}/tml-fa4-${TML_FA4_COMMIT}"
		export TRITON_KERNELS_SRC_DIR="${WORKDIR}/triton-${TRITON_PV}/python/triton_kernels/triton_kernels"

		# CUDA architecture list (user-configurable via make.conf)
		if [[ -n "${TORCH_CUDA_ARCH_LIST}" ]]; then
			export TORCH_CUDA_ARCH_LIST
		fi
	elif use rocm; then
		export VLLM_TARGET_DEVICE="rocm"
		export ROCM_PATH="${EPREFIX}/usr"
		export PYTORCH_ROCM_ARCH="$(get_amdgpu_flags)"

		# Allow sandbox access to GPU devices for HIP compilation
		addpredict /dev/kfd
		addpredict /dev/dri
	else
		export VLLM_TARGET_DEVICE="cpu"
	fi

	distutils-r1_python_compile
}

python_install_all() {
	distutils-r1_python_install_all

	newinitd "${FILESDIR}"/vllm.initd vllm
	newconfd "${FILESDIR}"/vllm.confd vllm
	systemd_dounit "${FILESDIR}"/vllm.service

	keepdir /var/lib/vllm
	keepdir /var/log/vllm
	fowners vllm:vllm /var/lib/vllm /var/log/vllm
}

pkg_postinst() {
	if use cuda && [[ -z "${TORCH_CUDA_ARCH_LIST}" ]]; then
		ewarn "vLLM was built with default CUDA architectures."
		ewarn "For optimal performance, set TORCH_CUDA_ARCH_LIST in make.conf"
		ewarn "to match your GPU. For example:"
		ewarn "  TORCH_CUDA_ARCH_LIST=\"8.9\"  # RTX 4090"
		ewarn ""
		ewarn "Find your GPU's compute capability at:"
		ewarn "  https://developer.nvidia.com/cuda-gpus"
	fi

	if use rocm; then
		elog "vLLM was built for ROCm with GPU targets: $(get_amdgpu_flags)"
		elog "To change targets, adjust AMDGPU_TARGETS in your USE flags"
		elog "and rebuild."
		elog ""
		elog "If you get 'use_libuv was requested but PyTorch was built"
		elog "without libuv support', rebuild caffe2 with USE=libuv or set:"
		elog "  USE_LIBUV=0 vllm serve <model>"
	fi

	elog "vLLM has been installed. Run 'vllm serve <model>' to start serving."
	elog ""
	elog "To run as a system service:"
	elog "  1. Set VLLM_MODEL in /etc/conf.d/vllm"
	elog "  2. OpenRC:  rc-service vllm start"
	elog "  3. systemd: systemctl start vllm"
}
