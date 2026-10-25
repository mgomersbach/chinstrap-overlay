# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYPI_VERIFY_REPO=https://github.com/modelcontextprotocol/python-sdk
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Model Context Protocol wire types"
HOMEPAGE="
	https://modelcontextprotocol.io/
	https://github.com/modelcontextprotocol/python-sdk
	https://pypi.org/project/mcp-types/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pydantic-2.12.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.13.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/uv-dynamic-versioning[${PYTHON_USEDEP}]
"
