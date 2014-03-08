# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
SUPPORT_PYTHON_ABIS="1"

inherit distutils


DESCRIPTION="A simple Python lib to retreive battery information"
HOMEPAGE="https://github.com/nicolargo/batinfo"
SRC_URI="https://pypi.python.org/packages/source/b/batinfo/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"


