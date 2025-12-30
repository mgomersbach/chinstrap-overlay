# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Small bashscript to automatically update @world"
HOMEPAGE="https://github.com/mgomersbach/updateworld"
EGIT_REPO_URI="https://github.com/mgomersbach/updateworld.git"

LICENSE="WTFPL-2"
SLOT="0"

RDEPEND="
	app-admin/eclean-kernel
	app-portage/gentoolkit
	sys-kernel/dracut
"

src_install() {
	exeinto /usr/bin
	doexe updateworld
}
