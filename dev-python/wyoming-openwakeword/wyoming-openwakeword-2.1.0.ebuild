# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,14} )
inherit distutils-r1
DESCRIPTION="Wyoming server for openWakeWord (wake-word detection for voice satellites)"
HOMEPAGE="https://github.com/rhasspy/wyoming-openwakeword"
SRC_URI="https://github.com/rhasspy/wyoming-openwakeword/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RDEPEND="
	>=dev-python/pyopen-wakeword-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/wyoming-1.8[${PYTHON_USEDEP}]
"
python_prepare_all() {
	# Upstream packages.find include lacks the wildcard; add it so any subpackage
	# (and bundled model data) is kept in the wheel.
	sed -i 's/include = \["wyoming_openwakeword"\]/include = ["wyoming_openwakeword", "wyoming_openwakeword.*"]/' pyproject.toml || die
	distutils-r1_python_prepare_all
}
