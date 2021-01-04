# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Grub2 GFX theme Steam Big Picture"
HOMEPAGE="https://github.com/mgomersbach/${PN}"
SRC_URI="https://github.com/mgomersbach/${PN}/archive/master.tar.gz -> ${P}.tar.gz"

LICENSE="AFL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"/${PN}-master
RESTRICT="bindist mirror"

src_install() {
	insinto /usr/share/grub/themes/${PN}
	doins -r .
}
