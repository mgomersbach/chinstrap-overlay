# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Official icon theme from the Numix project."
HOMEPAGE="https://github.com/numixproject/numix-icon-theme"
if [[ ${PV} == *9999* ]];then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/numixproject/numix-icon-theme"
	KEYWORDS=""
else
	SRC_URI="https://github.com/numixproject/numix-icon-theme/archive/v${PV}/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
	RESTRICT="mirror"
fi

LICENSE="GPL-3.0+"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare(){
	eapply_user
}

src_install(){
	insinto /usr/share/icons
	doins -r Numix || die "Install failed!"
	doins -r Numix-Light || die "Install failed!"
	dodoc readme.md
}

