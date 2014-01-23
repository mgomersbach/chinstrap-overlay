# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5

DESCRIPTION="Transport Stream Muxer which is spec compliant. Part of the Open Broadcast Encoder project"
HOMEPAGE="http://www.ob-encoder.com/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kierank/libmpegts.git"
[ -n "${EVCS_OFFLINE}" ] || EGIT_REPACK=true
inherit eutils git-2

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="debug static-libs pic"

src_configure() {
    econf $(use_enable debug) \
    econf $(use_enable static-libs static) \
    econf $(use_enable pic)
}

src_install() {
    emake DESTDIR="${D}" install
    dodoc README
}
