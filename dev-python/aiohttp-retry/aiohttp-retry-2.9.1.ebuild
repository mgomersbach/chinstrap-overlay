# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,14} )
EPYTEST_PLUGINS=( pytest-aiohttp )
PYPI_NO_NORMALIZE=1
PYPI_PN="aiohttp_retry"

inherit distutils-r1 pypi

DESCRIPTION="Simple retry client for aiohttp"
HOMEPAGE="
	https://github.com/inyutin/aiohttp_retry
	https://pypi.org/project/aiohttp-retry/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
