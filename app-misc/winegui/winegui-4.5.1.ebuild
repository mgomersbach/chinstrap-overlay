# Copyright 2023-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake gnome2-utils xdg

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://gitlab.melroy.org/melroy/winegui"
	inherit git-r3
else
	# gitlab.melroy.org archives need a login; use the official GitHub mirror
	SRC_URI="https://github.com/winegui/WineGUI/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/WineGUI-${PV}"
	KEYWORDS="~amd64"
fi

DESCRIPTION="WineGUI is a user-friendly WINE graphical interface"
HOMEPAGE="https://winegui.melroy.org/"
LICENSE="AGPL-3+"
SLOT="0"

IUSE="doc"

BDEPEND="
	virtual/pkgconfig
	doc? ( app-text/doxygen )
"
DEPEND="
	>=dev-cpp/gtkmm-4.10:4.0
	>=dev-cpp/nlohmann_json-3.10
"
RDEPEND="
	>=dev-cpp/gtkmm-4.10:4.0
	virtual/wine
	app-emulation/winetricks
"

src_configure() {
	local mycmakeargs=(
		-DGSETTINGS_LOCALCOMPILE=OFF
		-DDOXYGEN=$(usex doc ON OFF)
	)

	cmake_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
