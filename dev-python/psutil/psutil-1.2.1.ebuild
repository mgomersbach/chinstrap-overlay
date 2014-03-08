# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils


DESCRIPTION="A process and system utilities module for Python"
HOMEPAGE="http://code.google.com/p/psutil/"
SRC_URI="https://pypi.python.org/packages/source/p/psutil/${P}.tar.gz"

LICENSE=""
KEYWORDS="~amd64"
SLOT="0"
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"


src_install() {
	distutils_src_install
	if use examples; then
		insinto /usr/share/doc/"${PF}"/
		doins -r examples
	fi
}
