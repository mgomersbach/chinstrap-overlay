# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Convert HTML to restructuredText"
HOMEPAGE="https://github.com/podados/python-html2rest"
SRC_URI="http://pypi.python.org/packages/source/h/html2rest/html2rest-0.2.2.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
IUSE=""

DEPEND="dev-python/beautifulsoup"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="html2rest.py"

src_prepare() {
	distutils_src_prepare
}
