# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Pop_Icons is the icon theme for Pop!_OS. It uses a semi-flat design with raised 3D motifs to help give depth to icons."
HOMEPAGE="https://github.com/pop-os/icon-theme"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="${HOMEPAGE}.git"
	KEYWORDS=""
else
	SRC_URI="${HOMEPAGE}/archive/v${PV}/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi

LICENSE="GPL-3 CC-BY-SA-4.0"
SLOT="0"
