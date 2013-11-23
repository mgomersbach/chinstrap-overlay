# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

EGIT_REPO_URI="https://github.com/rspivak/slimit.git"
[ -n "${EVCS_OFFLINE}" ] || EGIT_REPACK=true
inherit eutils git-2 confutils distutils

DESCRIPTION="SlimIt - a JavaScript minifier/parser in Python"
HOMEPAGE="https://github.com/rspivak/slimit"
SRC_URI=""

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"

