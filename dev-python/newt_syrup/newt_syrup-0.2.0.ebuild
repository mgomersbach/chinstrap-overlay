# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS=1

inherit distutils

DESCRIPTION="A Python framework for creating text-based applications"
HOMEPAGE="http://fedorahosted.org/newt-syrup/"
SRC_URI="http://mcpierce.fedorapeople.org/sources/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-libs/newt-0.52.11"

RESTRICT_PYTHON_ABIS="3.*"
DOCS="COLORS"
