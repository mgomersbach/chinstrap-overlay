# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Portage package sets for Chinstrap overlay"
HOMEPAGE="https://github.com/mgomersbach/chinstrap-overlay"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

src_unpack() {
	mkdir -p "${S}" || die
}

src_install() {
	insinto /usr/share/portage/config/sets
	newins "${FILESDIR}/tc.conf" tc.conf
}
