# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )
LLVM_COMPAT=( 20 )

inherit distutils-r1 llvm-r2 pypi

DESCRIPTION="Lightweight LLVM Python binding for writing JIT compilers"
HOMEPAGE="
	https://llvmlite.readthedocs.io/
	https://github.com/numba/llvmlite
	https://pypi.org/project/llvmlite/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	$(llvm_gen_dep '
		llvm-core/llvm:${LLVM_SLOT}=
	')
"
RDEPEND="${DEPEND}"
BDEPEND="
	$(llvm_gen_dep '
		llvm-core/llvm:${LLVM_SLOT}=
	')
"

RESTRICT="test"

pkg_setup() {
	llvm-r2_pkg_setup
	python_setup
}

src_prepare() {
	# Gentoo LLVM is built with shared libraries; static .a files are not available
	sed -i 's/set(LLVMLITE_SHARED_DEFAULT OFF)/set(LLVMLITE_SHARED_DEFAULT ON)/' \
		ffi/CMakeLists.txt || die
	# setuptools >=80 dropped the dry_run kwarg from distutils spawn()
	sed -i 's/spawn(cmd, dry_run=dry_run)/spawn(cmd)/' setup.py || die
	distutils-r1_src_prepare
}

src_compile() {
	export LLVM_CONFIG="$(get_llvm_prefix)/bin/llvm-config"
	distutils-r1_src_compile
}

src_install() {
	export LLVM_CONFIG="$(get_llvm_prefix)/bin/llvm-config"
	distutils-r1_src_install
}
