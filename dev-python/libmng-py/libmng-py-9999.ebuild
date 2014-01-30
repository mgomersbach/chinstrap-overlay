# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="5"

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit distutils git-2

DESCRIPTION="A library for accessing and displaying MNG files with Python."
HOMEPAGE="https://github.com/thousandparsec-obsolete/libmng-py"
EGIT_REPO_URI="https://github.com/thousandparsec-obsolete/libmng-py.git"
[ -n "${EVCS_OFFLINE}" ] || EGIT_REPACK=true

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="media-libs/libmng
        dev-python/pygame
        dev-qt/qtwebkit
        dev-python/wxpython"
RDEPEND="${DEPEND}"
