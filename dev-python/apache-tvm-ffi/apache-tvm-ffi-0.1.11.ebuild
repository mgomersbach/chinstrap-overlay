# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=scikit-build-core
PYPI_PN="apache_tvm_ffi"
PYTHON_COMPAT=( python3_{13..14} )
inherit distutils-r1 pypi

DESCRIPTION="Lightweight, framework-agnostic FFI module from Apache TVM"
HOMEPAGE="
	https://github.com/apache/tvm-ffi
	https://pypi.org/project/apache-tvm-ffi/
"

# bundled 3rdparty/libbacktrace is BSD
LICENSE="Apache-2.0 BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/typing-extensions-4.5[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/cython-3.0[${PYTHON_USEDEP}]
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

# Gentoo's scikit-build-core config replaces upstream cmake.args, so the
# Cython module has to be switched back on or tvm_ffi cannot be imported.
DISTUTILS_ARGS=(
	-DTVM_FFI_BUILD_PYTHON_MODULE=ON
	-DTVM_FFI_BUILD_TESTS=OFF
)
