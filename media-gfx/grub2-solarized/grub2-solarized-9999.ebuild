# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Grub2 GFX theme Steam Big Picture"
HOMEPAGE="https://github.com/mgomersbach/grub2-solarized"
SRC_URI="https://github.com/mgomersbach/grub2-solarized/archive/master.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/grub2-solarized-master"

LICENSE="AFL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="bindist mirror"

src_install() {
	insinto /usr/share/grub/themes/${PN}
	doins -r .
}
