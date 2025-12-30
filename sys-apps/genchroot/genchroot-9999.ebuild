# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Small bashscript to aid in chroots"
HOMEPAGE="https://github.com/mgomersbach/genchroot"
EGIT_REPO_URI="https://github.com/mgomersbach/genchroot.git"

LICENSE="GPL-2"
SLOT="0"

RDEPEND="sys-apps/coreutils"

src_install() {
	exeinto /usr/bin
	doexe genchroot
}
