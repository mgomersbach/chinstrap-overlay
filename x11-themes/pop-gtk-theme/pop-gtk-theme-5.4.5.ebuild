# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="System76 Pop GTK+ Theme, based in adapta-gtk-theme"
HOMEPAGE="https://github.com/pop-os/gtk-theme"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pop-os/gtk-theme"
else
	SRC_URI="https://github.com/pop-os/gtk-theme/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
	S="${WORKDIR}/gtk-theme-${PV}"
fi

LICENSE="GPL-2"
SLOT="0"

DEPEND="
	>=x11-libs/gtk+-2.24.30:2
	>=x11-libs/gtk+-3.18.9:3
	>=x11-libs/gdk-pixbuf-2.24.30
	>=dev-libs/glib-2.48
	>=gnome-base/librsvg-2.40.13
	dev-libs/libxml2
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-lang/sassc-3.3.2
	media-gfx/inkscape
	media-gfx/optipng"
