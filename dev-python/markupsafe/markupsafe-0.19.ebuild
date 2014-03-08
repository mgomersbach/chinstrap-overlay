# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

MY_PN="MarkupSafe"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Implements a XML/HTML/XHTML Markup safe string for Python"
HOMEPAGE="http://github.com/mitsuhiko/markupsafe"
SRC_URI="https://pypi.python.org/packages/source/M/MarkupSafe/${MY_P}.tar.gz"

LICENSE="BSD-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

