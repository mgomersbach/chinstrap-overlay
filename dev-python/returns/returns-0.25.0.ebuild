# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

DESCRIPTION="Make your functions return something meaningful, typed, and safe"
HOMEPAGE="https://github.com/dry-python/returns"
SRC_URI="https://github.com/dry-python/returns/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${PV}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/typing-extensions[${PYTHON_USEDEP}]"
BDEPEND="dev-python/poetry-core[${PYTHON_USEDEP}]"
