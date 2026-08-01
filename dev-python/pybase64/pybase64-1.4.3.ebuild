# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Fast Base64 encoding/decoding in Python using C library libbase64"
HOMEPAGE="
	https://github.com/mayeut/pybase64
	https://pypi.org/project/pybase64/
"
SRC_URI="$(pypi_sdist_url)"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

RESTRICT="test"
