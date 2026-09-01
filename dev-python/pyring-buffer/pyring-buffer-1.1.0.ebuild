# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,14} )
PYPI_PN="pyring_buffer"

inherit distutils-r1 pypi

DESCRIPTION="Ring buffer backed by a Python bytearray"
HOMEPAGE="
	https://github.com/rhasspy/pyring-buffer
	https://pypi.org/project/pyring-buffer/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
