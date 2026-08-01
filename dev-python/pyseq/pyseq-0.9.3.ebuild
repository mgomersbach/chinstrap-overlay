# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Compressed file sequence string module (e.g. img.[1-100].jpg)"
HOMEPAGE="
	https://github.com/rsgalloway/pyseq
	https://pypi.org/project/pyseq/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

python_install_all() {
	distutils-r1_python_install_all
	# Upstream's `sdiff` console_script collides with sys-apps/diffutils;
	# the others (lss, scopy, sfind, smv, srm, sstat, stree) are generic
	# names users wouldn't expect from a Python sequence library. Strip
	# them all — Meshroom only uses pyseq as a library.
	rm -r "${ED}/usr/bin" || die
}
