# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A script to convert Docutils internal XML representation (back) to reStructuredText."
HOMEPAGE="http://www.merten-home.de/FreeSoftware/xml2rst/"
SRC_URI="http://www.merten-home.de/FreeSoftware/xml2rst/xml2rst-1.1.1.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
IUSE=""

DEPEND="dev-python/lxml"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="xml2rst.py"

src_prepare() {
	distutils_src_prepare
}
