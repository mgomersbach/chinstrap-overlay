# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..13} )
export UV_DYNAMIC_VERSIONING_BYPASS=${PV}

inherit distutils-r1

DESCRIPTION="Model Context Protocol SDK"
HOMEPAGE="https://github.com/modelcontextprotocol/python-sdk"
SRC_URI="https://github.com/modelcontextprotocol/python-sdk/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cli rich"

RDEPEND="
    dev-python/anyio[${PYTHON_USEDEP}]
    dev-python/httpx[${PYTHON_USEDEP}]
    dev-python/httpx-sse[${PYTHON_USEDEP}]
    dev-python/pydantic[${PYTHON_USEDEP}]
    dev-python/starlette[${PYTHON_USEDEP}]
    dev-python/sse-starlette[${PYTHON_USEDEP}]
    dev-python/pydantic-settings[${PYTHON_USEDEP}]
    dev-python/uvicorn[${PYTHON_USEDEP}]
    dev-python/returns[${PYTHON_USEDEP}]
    cli? (
        dev-python/typer[${PYTHON_USEDEP}]
        dev-python/python-dotenv[${PYTHON_USEDEP}]
    )
    rich? ( dev-python/rich[${PYTHON_USEDEP}] )
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-python/dunamai[${PYTHON_USEDEP}]
	dev-python/hatchling[${PYTHON_USEDEP}]
	dev-python/uv-dynamic-versioning[${PYTHON_USEDEP}]
"

S="${WORKDIR}/python-sdk-${PV}"

#src_install() {
#    distutils-r1_src_install
#}
