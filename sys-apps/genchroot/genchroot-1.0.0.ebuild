# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Small bashscript to aid in chroots"
HOMEPAGE="https://github.com/mgomersbach/genchroot"
SRC_URI="https://github.com/mgomersbach/genchroot/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="sys-apps/coreutils"

src_install() {
	exeinto /usr/bin
	doexe genchroot
}
