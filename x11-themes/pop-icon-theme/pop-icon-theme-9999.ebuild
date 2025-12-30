# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Pop_Icons is the icon theme for Pop!_OS."
HOMEPAGE="https://github.com/pop-os/icon-theme"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pop-os/icon-theme.git"
else
	SRC_URI="https://github.com/pop-os/icon-theme/archive/v${PV}/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi

LICENSE="GPL-3 CC-BY-SA-4.0"
SLOT="0"
