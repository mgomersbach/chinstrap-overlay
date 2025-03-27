# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="A proxy server to connect to MCP servers over SSE transport or expose stdio servers as SSE servers."
HOMEPAGE="https://github.com/sparfenyuk/mcp-proxy"
SRC_URI="https://github.com/sparfenyuk/mcp-proxy/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

    #dev-python/fastapi[${PYTHON_USEDEP}]
RDEPEND="
    dev-python/anyio[${PYTHON_USEDEP}]
    dev-python/certifi[${PYTHON_USEDEP}]
    dev-python/charset-normalizer[${PYTHON_USEDEP}]
    dev-python/h11[${PYTHON_USEDEP}]
    dev-python/idna[${PYTHON_USEDEP}]
    dev-python/pydantic[${PYTHON_USEDEP}]
    dev-python/requests[${PYTHON_USEDEP}]
    dev-python/sniffio[${PYTHON_USEDEP}]
    dev-python/starlette[${PYTHON_USEDEP}]
    dev-python/typing-extensions[${PYTHON_USEDEP}]
    dev-python/uvicorn[${PYTHON_USEDEP}]
    dev-python/urllib3[${PYTHON_USEDEP}]
    dev-python/mcp[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

BDEPEND="
    dev-python/setuptools[${PYTHON_USEDEP}]
"

S="${WORKDIR}/${PN}-${PV}"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_compile() {
	distutils-r1_python_compile
}

python_install_all() {
	distutils-r1_python_install_all
}
