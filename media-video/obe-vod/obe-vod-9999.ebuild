# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=4

DESCRIPTION="Open Broadcast Encoder - Video On Demand"
HOMEPAGE="http://www.ob-encoder.com/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kierank/obe-vod.git"
[ -n "${EVCS_OFFLINE}" ] || EGIT_REPACK=true
inherit eutils git-2 confutils

EBUILD_SUPPORTS_SHAREDEXT=1

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="+cli +opencl +threads visualize debug gprof strip +asm +avisynth +ffmpeg +ffmpegsource +mp4 static-libs pic +interlaced +x264 +sharedext custom-cflags 10bit"

RDEPEND="=media-libs/x264-9999
    ffmpeg? ( virtual/ffmpeg )
    >=virtual/ffmpeg-0.10
    || ( media-video/ffmpeg:0 media-libs/libpostproc )
    ~media-libs/x264-${PV}[10bit=,interlaced=,threads=]
    avisynth? ( =media-video/avxsynth-9999 )
    ffmpegsource? ( =media-libs/ffmpegsource-9999 )
    mp4? ( >=media-video/gpac-0.4.1_pre20060122 )
    opencl? ( virtual/opencl )
    =media-libs/libmpegts-9999
    >=dev-lang/yasm-1.2.0
    "
DEPEND="${RDEPEND}"

pkg_setup() {
    confutils_init
}

src_prepare() {
    epatch "${FILESDIR}/removegpacchk.patch"
}

src_configure() {
    tc-export CC
    use custom-cflags || filter-flags -O?
    ./configure \
        --prefix="${EPREFIX}"/usr \
        --libdir="${EPREFIX}"/usr/$(get_libdir) \
        --system-libx264 \
        --host="${CHOST}" \
        $(usex 10bit "--bit-depth=10" "") \
        $(usex avs "" "--disable-avs") \
        $(usex ffmpeg "" "--disable-lavf --disable-swscale") \
        $(usex ffmpegsource "" "--disable-ffms") \
        $(usex interlaced "" "--disable-interlaced") \
        $(usex mp4 "" "--disable-gpac") \
        $(use_enable debug) \
        $(use_enable cli) \
        $(use_enable opencl) \
        $(use_enable visualize) \
        $(use_enable gprof) \
        $(use_enable strip) \
        $(use_enable asm) \
        $(use_enable lavf) \
        $(use_enable sharedext shared) \
        $(use_enable static-libs static) \
        $(use_enable pic) \
        $(usex threads "" "--disable-thread") || die

    # this is a nasty workaround for bug #376925 for x264 that also applies
    # here, needed because as upstream doesn't like us fiddling with their CFLAGS
    if use custom-cflags; then
        local cflags
        cflags="$(grep "^CFLAGS=" config.mak | sed 's/CFLAGS=//')"
        cflags="${cflags//$(get-flag O)/}"
        cflags="${cflags//-O? /$(get-flag O) }"
        cflags="${cflags//-g /}"
        sed -i "s:^CFLAGS=.*:CFLAGS=${cflags//:/\\:}:" config.mak
    fi
}

src_install() {
    emake DESTDIR="${D}" install
    dodoc doc/*
}

