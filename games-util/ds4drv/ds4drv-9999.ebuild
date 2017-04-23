# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3} )

inherit distutils-r1 linux-info udev

DESCRIPTION="A Sony DualShock 4 userspace driver for Linux"
HOMEPAGE="https://github.com/chrippa/ds4drv"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/chrippa/${PN}.git"
	KEYWORDS=""
else
	MY_PV=$(replace_version_separator 3 '-')
	MY_P="${PN}-${MY_PV}"

	SRC_URI="https://github.com/chrippa/${PN}/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

RESTRICT="mirror"

SLOT="0"
LICENSE="MIT"
IUSE=""

RDEPEND="
	dev-python/python-evdev
	dev-python/pyudev
	dev-python/setuptools
	virtual/udev
"
DEPEND="${RDEPEND}"

DOCS=( HISTORY.rst README.rst )

pkg_setup() {
	linux-info_pkg_setup
	CONFIG_CHECK="INPUT_UINPUT HID_SONY"
	check_extra_config
}

python_install() {
	udev_dorules "${FILESDIR}/udev/50-${PN}.rules"

	insinto "/etc"
	doins "ds4drv.conf"

	distutils-r1_python_install
}

pkg_postinst() {
	udev_reload
}
