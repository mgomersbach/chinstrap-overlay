# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="AvxSynth is a Linux port of the AviSynth toolkit."
HOMEPAGE="https://github.com/avxsynth/avxsynth"
SRC_URI=""

EGIT_REPO_URI="https://github.com/avxsynth/avxsynth.git"
[ -n "${EVCS_OFFLINE}" ] || EGIT_REPACK=true
inherit eutils git-2 confutils

EBUILD_SUPPORTS_SHAREDEXT=1

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="+autocrop +framecapture +subtitle +ffmpegsource avxedit +sharedext static-libs"

RDEPEND="ffmpegsource? ( =media-libs/ffmpegsource-9999 )
    framecapture? ( virtual/jpeg )
    avxedit? ( dev-qt/qtcore dev-libs/glib x11-libs/pixman x11-libs/libdrm x11-libs/cairo dev-libs/gobject-introspection x11-libs/pango media-video/mplayer )
    media-libs/freetype
    media-libs/libpng
    dev-libs/log4cpp
    "
DEPEND="${RDEPEND}"

src_prepare() {
    autoreconf -f -i
    epatch "${FILESDIR}/removelibtool.patch"
}

src_configure() {
    econf $(use_enable sharedext shared) \
    econf $(use_enable static-libs static) \
    econf $(use_enable ffmpegsource ffms2) \
    econf $(use_enable autocrop) \
    econf $(use_enable framecapture) \
    econf $(use_enable subtitle) \
    econf $(use_enable avxedit) \
    econf --disable-fast-install
}

src_install() {
    emake DESTDIR="${D}" install
    dodoc README.md
}

