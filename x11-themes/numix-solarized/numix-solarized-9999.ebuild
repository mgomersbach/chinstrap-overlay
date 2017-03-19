# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils autotools

DESCRIPTION=""
HOMEPAGE="https://github.com/Ferdi265/numix-solarized-gtk-theme"
if [[ ${PV} == *9999* ]];then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/Ferdi265/numix-solarized-gtk-theme"
	KEYWORDS=""
else
	SRC_URI="https://github.com/Ferdi265/numix-solarized-gtk-theme/archive/v${PV}/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
	RESTRICT="mirror"
fi

LICENSE="LGPL-3.0"
SLOT="0"
IUSE=""

DEPEND="dev-ruby/sass x11-themes/gtk-engines-murrine"
RDEPEND="${DEPEND}"

src_prepare(){
	eapply_user
}

