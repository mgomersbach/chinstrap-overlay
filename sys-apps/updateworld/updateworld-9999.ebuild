# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mgomersbach/updateworld.git"
	KEYWORDS="~amd64"
else
	SRC_URI="https://github.com/mgomersbach/updateworld/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64"
fi

DESCRIPTION="Small bashscript to automatically update @world"
HOMEPAGE="https://github.com/mgomersbach/updateworld"

LICENSE="WTFPL-2"
SLOT="0"

DEPEND=""
RDEPEND="
app-admin/eclean-kernel
app-portage/gentoolkit
sys-kernel/dracut"

src_install() {
	exeinto /usr/bin
	doexe updateworld
}
