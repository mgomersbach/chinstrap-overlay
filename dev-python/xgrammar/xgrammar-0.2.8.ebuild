# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Efficient, flexible, and portable structured generation library"
HOMEPAGE="
	https://xgrammar.mlc.ai/
	https://github.com/mlc-ai/xgrammar
	https://pypi.org/project/xgrammar/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# triton is only used by the CUDA bitmask kernel and imported lazily;
# vllm pulls it in where it is needed.
RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/apache-tvm-ffi-0.1.11[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.9.0[${PYTHON_USEDEP}]
	')
	>=sci-ml/pytorch-1.10.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.38.0[${PYTHON_SINGLE_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-build/cmake
	$(python_gen_cond_dep '
		>=dev-python/apache-tvm-ffi-0.1.10[${PYTHON_USEDEP}]
		>=dev-python/scikit-build-core-0.10.0[${PYTHON_USEDEP}]
		>=dev-python/setuptools-scm-8.1[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	# respect user flags: drop -Werror and the forced LTO
	sed -e 's/ -Werror//' -e 's/ -flto=auto//' -i CMakeLists.txt || die
	distutils-r1_src_prepare
}
