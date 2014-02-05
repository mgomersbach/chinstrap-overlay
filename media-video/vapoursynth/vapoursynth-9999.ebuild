# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5

S="${WORKDIR}/${PN}"
inherit eutils git-2 python waf-utils

DESCRIPTION="A frameserver for the 21st century"
HOMEPAGE="http://www.vapoursynth.com/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/vapoursynth/vapoursynth.git"

EBUILD_SUPPORTS_SHAREDEXT=1

USE_PYTHON="3::3.3"
PYTHON_ABIS="3.3"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="debug +avisynth +ffmpeg static-libs +sharedext +script +pipe +filters +examples +doc"

RDEPEND="
    >=virtual/ffmpeg-0.10
    || ( media-video/ffmpeg:0 media-libs/libpostproc )
    "
DEPEND="${RDEPEND}"
src_unpack() {
    git-2_src_unpack
    cd "${S}"
}

pkg_setup() {
    python_set_active_version 3
}

waf-utils_src_configure() {
    ./bootstrap.py
    ./waf configure \
        $(usex debug "--mode=debug" "--mode=release") \
        $(usex sharedext "--shared=true" "--shared=false") \
        $(usex static-libs "--static=true" "--static=false") \
        $(usex avisynth "--avisynth=true" "--avisynth=false") \
        $(usex script "--script=true" "--script=false") \
        $(usex pipe "--pipe=true" "--pipe=false") \
        $(usex filters "--filters=true" "--filters=false") \
        $(usex examples "--examples=true" "--examples=false") \
        $(usex doc "--docs=true" "--docs=false") \
        --prefix=/usr
}

waf-utils_src_compile() {
    ./waf build
}

waf-utils_src_install() {
    ./waf --destdir=\"${D}\" install
    dodoc -r doc/
}

