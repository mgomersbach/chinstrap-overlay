# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.gomersbach.nl/mgomersbach/updateworld.git"
	KEYWORDS="~amd64"
else
	SRC_URI="https://git.gomersbach.nl/mgomersbach/updateworld/repository/${PV}/archive.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64"
fi

DESCRIPTION="Small bashscript to automatically update @world"
HOMEPAGE="https://git.gomersbach.nl/mgomersbach/updateworld"

LICENSE="WTFPL-2"
SLOT="0"

DEPEND=""
RDEPEND="app-portage/gentoolkit"

src_install() {
	exeinto /usr/bin
	doexe updateworld
}
