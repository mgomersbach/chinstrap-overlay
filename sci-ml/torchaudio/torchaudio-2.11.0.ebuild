# Copyright 2020-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
inherit cuda distutils-r1 multiprocessing optfeature

DESCRIPTION="Data manipulation and transformation for audio signal processing"
HOMEPAGE="https://github.com/pytorch/audio"
SRC_URI="https://github.com/pytorch/audio/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/audio-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
# 2.11 builds via torch.utils.cpp_extension: GPU kernels are CUDA-only and
# OpenMP is inherited from torch, so rocm/openmp are no longer build knobs.
IUSE="cuda +rnnt"

# Extensions target the torch 2.10 stable ABI (py_limited_api), so any
# torch >= the paired 2.13 release works; caffe2 is merged into pytorch.
DEPEND="
	>=sci-ml/pytorch-2.13[${PYTHON_SINGLE_USEDEP},cuda?]
"
RDEPEND="${DEPEND}"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			dev-python/expecttest[${PYTHON_USEDEP}]
			dev-python/numpy[${PYTHON_USEDEP}]
			dev-python/typing-extensions[${PYTHON_USEDEP}]
			dev-python/parameterized[${PYTHON_USEDEP}]
			dev-python/scipy[${PYTHON_USEDEP}]
			dev-python/scikit-learn[${PYTHON_USEDEP}]
			dev-python/soundfile[${PYTHON_USEDEP}]
		')
	)
"

distutils_enable_tests pytest

src_compile() {
	export MAX_JOBS="$(makeopts_jobs)" # Let ninja respect MAKEOPTS

	export USE_CUDA=$(usex cuda 1 0)
	export USE_ROCM=0
	export BUILD_RNNT=$(usex rnnt 1 0)
	export BUILD_VERSION="${PV}"

	distutils-r1_src_compile
}

python_test() {
	epytest -p expecttest
}

pkg_postinst() {
	optfeature "SoundFile I/O backend" dev-python/soundfile
}
