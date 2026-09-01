# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,14} )

inherit distutils-r1

DESCRIPTION="Remote voice satellite using the Wyoming protocol"
HOMEPAGE="https://github.com/rhasspy/wyoming-satellite"
SRC_URI="https://github.com/rhasspy/wyoming-satellite/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/wyoming-1.5.4[${PYTHON_USEDEP}]
	>=dev-python/pyring-buffer-1.0.0[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]
"

python_prepare_all() {
	rm -rf installer || die
	sed -i 's/include = \["wyoming_satellite"\]/include = ["wyoming_satellite", "wyoming_satellite.*"]/' pyproject.toml || die
	distutils-r1_python_prepare_all
}
