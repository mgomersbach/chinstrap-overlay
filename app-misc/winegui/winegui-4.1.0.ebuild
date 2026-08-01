# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://gitlab.melroy.org/melroy/winegui"
	inherit git-r3
else
	SRC_URI="https://gitlab.melroy.org/melroy/winegui/-/archive/v${PV}/winegui-v${PV}.tar.bz2 -> ${P}.tar.bz2"
	S="${WORKDIR}/${PN}-v${PV}"
	KEYWORDS="~amd64"
fi

DESCRIPTION="WineGUI is a user-friendly WINE graphical interface"
HOMEPAGE="https://gitlab.melroy.org/melroy/winegui"
LICENSE="AGPL-3+"
SLOT="0"

IUSE="doc"

BDEPEND="
	virtual/pkgconfig
	doc? ( app-text/doxygen )
"
DEPEND="
	dev-cpp/gtkmm:3.0
"
RDEPEND="
	${DEPEND}
	virtual/wine
	app-emulation/winetricks
"

src_configure() {
	local mycmakeargs=(
		-DGSETTINGS_LOCALCOMPILE=OFF
		-Ddoc=$(usex doc ON OFF)
	)

	cmake_src_configure
}
