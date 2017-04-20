# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Solarized theme for sddm"
HOMEPAGE="https://github.com/MalditoBarbudo/solarized_sddm_theme"
if [[ ${PV} == *9999* ]];then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/MalditoBarbudo/solarized_sddm_theme"
	KEYWORDS=""
else
	SRC_URI="https://github.com/MalditoBarbudo/solarized_sddm_theme/archive/v${PV}/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
	RESTRICT="mirror"
fi

LICENSE="GPL-3.0"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare(){
	eapply_user
}

src_install(){
	insinto /usr/share/sddm/themes/solarized
	doins -r . || die "Install failed!"
	dodoc README.md
}
