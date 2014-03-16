# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:
EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )
EGIT_REPO_URI="https://github.com/ulfalizer/Kconfiglib.git"
[ -n "${EVCS_OFFLINE}" ] || EGIT_REPACK=true
inherit eutils git-2 confutils distutils-r1

DESCRIPTION="A flexible Python Kconfig parser and library"
HOMEPAGE="https://github.com/ulfalizer/Kconfiglib"
SRC_URI=""

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
