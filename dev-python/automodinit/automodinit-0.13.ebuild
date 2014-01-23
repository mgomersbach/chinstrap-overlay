# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Solves the problem of forgetting to keep __init__.py files up to date"
HOMEPAGE="https://pypi.python.org/pypi/automodinit"
SRC_URI="https://pypi.python.org/packages/source/a/automodinit/automodinit-0.13.zip"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="xml2rst.py"

src_prepare() {
	distutils_src_prepare
}
