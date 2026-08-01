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
CUTLASS_PV="4.4.2"
FLASH_ATTN_COMMIT="caaa4eb59845388a20b1f435ecaafb4bd9517ad8"
FLASHMLA_COMMIT="a8f794d1251cbfd88a5011445dd5582289c727e4"
QUTLASS_COMMIT="830d2c4537c7396e14a02a46fbddd18b5d107c65"
DEEPGEMM_COMMIT="a6b593d2826719dcf4892609af7b84ee23aaf32a"
FMHA_SM100_COMMIT="2e63ec37a0fc29bc20f39cd1a52e0f5affc33a73"
TML_FA4_COMMIT="b206834606ed5b5f21f8eed6b0683f528ea9cf7d"
TRITON_PV="3.5.1"

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
		https://github.com/deepseek-ai/DeepGEMM/archive/${DEEPGEMM_COMMIT}.tar.gz
			-> DeepGEMM-${DEEPGEMM_COMMIT}.tar.gz
		https://github.com/vllm-project/MSA/archive/${FMHA_SM100_COMMIT}.tar.gz
			-> MSA-${FMHA_SM100_COMMIT}.tar.gz
		https://github.com/vllm-project/tml-fa4/archive/${TML_FA4_COMMIT}.tar.gz
			-> tml-fa4-${TML_FA4_COMMIT}.tar.gz
		https://github.com/triton-lang/triton/archive/refs/tags/v${TRITON_PV}.tar.gz
			-> triton-${TRITON_PV}.tar.gz
	)
"

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
RDEPEND="
	${PYTHON_DEPS}
	acct-group/vllm
	acct-user/vllm

	$(python_gen_cond_dep '
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/anthropic[${PYTHON_USEDEP}]
		dev-python/blake3[${PYTHON_USEDEP}]
		dev-python/cachetools[${PYTHON_USEDEP}]
		dev-python/cbor2[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/compressed-tensors[${PYTHON_USEDEP}]
		dev-python/depyf[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/filelock[${PYTHON_USEDEP}]
		dev-python/huggingface-hub[${PYTHON_USEDEP}]
		dev-python/ijson[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/lark[${PYTHON_USEDEP}]
		dev-python/llguidance[${PYTHON_USEDEP}]
		dev-python/lm-format-enforcer[${PYTHON_USEDEP}]
		dev-python/mcp[${PYTHON_USEDEP}]
		dev-python/mistral-common[${PYTHON_USEDEP}]
		dev-python/msgspec[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/openai-harmony[${PYTHON_USEDEP}]
		dev-python/opentelemetry-api[${PYTHON_USEDEP}]
		dev-python/opentelemetry-exporter-otlp[${PYTHON_USEDEP}]
		dev-python/opentelemetry-sdk[${PYTHON_USEDEP}]
		dev-python/opentelemetry-semantic-conventions-ai[${PYTHON_USEDEP}]
		dev-python/outlines-core[${PYTHON_USEDEP}]
		dev-python/partial-json-parser[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/prometheus-client[${PYTHON_USEDEP}]
		dev-python/prometheus-fastapi-instrumentator[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/py-cpuinfo[${PYTHON_USEDEP}]
		dev-python/pybase64[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/python-json-logger[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/pyzmq[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/setproctitle[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/uvloop[${PYTHON_USEDEP}]
		dev-python/watchfiles[${PYTHON_USEDEP}]
		dev-python/xgrammar[${PYTHON_USEDEP}]
		dev-python/model-hosting-container-standards[${PYTHON_USEDEP}]
		media-libs/opencv[python]
		>=sci-ml/safetensors-0.6.2[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[${PYTHON_USEDEP}]
		sci-ml/tokenizers[${PYTHON_USEDEP}]
		>=sci-ml/transformers-5.5.3[${PYTHON_USEDEP}]
		<sci-ml/transformers-6[${PYTHON_USEDEP}]
	')

	>=sci-ml/pytorch-2.11.0[${PYTHON_SINGLE_USEDEP}]

	grpc? (
		$(python_gen_cond_dep '
			dev-python/grpcio[${PYTHON_USEDEP}]
			dev-python/grpcio-reflection[${PYTHON_USEDEP}]
		')
	)

	cuda? (
		>=sci-ml/caffe2-2.11.0[${PYTHON_SINGLE_USEDEP},cuda]
		>=sci-ml/torchaudio-2.10.0[${PYTHON_SINGLE_USEDEP}]
		>=sci-ml/torchvision-0.26.0[${PYTHON_SINGLE_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/numba[${PYTHON_USEDEP}]
		')
	)
	rocm? (
		>=sci-ml/caffe2-2.11.0[${PYTHON_SINGLE_USEDEP},rocm]
		>=sci-ml/torchvision-0.26.0[${PYTHON_SINGLE_USEDEP},rocm]
		dev-python/triton[${PYTHON_SINGLE_USEDEP}]
		dev-python/triton-kernels[${PYTHON_SINGLE_USEDEP}]
		dev-util/amdsmi
		$(python_gen_cond_dep '
			dev-python/conch-triton-kernels[${PYTHON_USEDEP}]
			dev-python/numba[${PYTHON_USEDEP}]
		')
	)
"

DEPEND="${RDEPEND}"

BDEPEND="
	>=dev-build/cmake-3.26.1
	dev-build/ninja
	$(python_gen_cond_dep '
		>=dev-python/setuptools-77.0.3[${PYTHON_USEDEP}]
		dev-python/setuptools-scm[${PYTHON_USEDEP}]
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
