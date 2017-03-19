# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils autotools

DESCRIPTION="Customizable Monoshape Vector Icon Theme for GTK+"
HOMEPAGE="https://github.com/jcubic/Clarity"
if [[ ${PV} == *9999* ]];then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/jcubic/Clarity"
	KEYWORDS=""
else
	SRC_URI="https://github.com/jcubic/Clarity/archive/v${PV}/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
	RESTRICT="mirror"
fi

LICENSE="LGPL-3.0"
SLOT="0"
IUSE=""

DEPEND="x11-themes/human-icon-theme"
RDEPEND="${DEPEND}"

src_prepare(){
	eapply_user
}

src_compile(){
	emake scalable || die "Make failed"
	emake static-files || die "Make failed"
	emake elements || die "Make failed"
	emake _16x16 || die "Make failed"
	emake canus || die "Make failed"
	emake gentoo || die "Make failed"
}

src_install(){
        dodir /usr/share/icons/Clarity
	into /usr/share/icons/Clarity
        cp -r static ${D}/usr/share/icons/Clarity
       	cp -r src ${D}/usr/share/icons/Clarity
        cp -r scalable ${D}/usr/share/icons/Clarity
        cp -r 16x16 ${D}/usr/share/icons/Clarity
}

