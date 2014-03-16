# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A simple, cross-platform GUI automation toolkit for Python."
HOMEPAGE="http://autopy.org"
SRC_URI="https://pypi.python.org/packages/source/a/autopy/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="x11-apps/xmessage"
DEPEND="${RDEPEND}"
