# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

DESCRIPTION="MCP proxy server for SSE transport and stdio server exposure"
HOMEPAGE="https://github.com/sparfenyuk/mcp-proxy"
SRC_URI="https://github.com/sparfenyuk/mcp-proxy/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

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
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
