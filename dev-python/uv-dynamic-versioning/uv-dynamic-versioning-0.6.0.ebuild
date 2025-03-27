# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Dynamic versioning based on VCS tags for uv/hatch projects"
HOMEPAGE="https://github.com/ninoseki/uv-dynamic-versioning"
SRC_URI="https://github.com/ninoseki/uv-dynamic-versioning/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
    dev-python/hatchling[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${PN}-${PV}"

src_install() {
    distutils-r1_src_install
}
