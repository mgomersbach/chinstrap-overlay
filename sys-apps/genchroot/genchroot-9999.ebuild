# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mgomersbach/genchroot.git"
	KEYWORDS="~amd64"
else
	SRC_URI="https://github.com/mgomersbach/genchroot/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64"
fi

DESCRIPTION="Small bashscript to aid in chroots"
HOMEPAGE="https://github.com/mgomersbach/genchroot"

LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="sys-apps/coreutils"

src_install() {
	exeinto /usr/bin
	doexe genchroot
}
