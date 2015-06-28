# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5

inherit autotools eutils toolchain-funcs games

DESCRIPTION="DOS emulator (unofficial SVN-based Daum patchset maintained by ykhwong)"
HOMEPAGE="http://ykhwong.x-y.net"
SRC_URI="${P}.7z"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa c++0x debug hardened opengl printer"

RESTRICT="fetch"

RDEPEND+="
  alsa? ( media-libs/alsa-lib )
  opengl? ( virtual/glu virtual/opengl )
  debug? ( sys-libs/ncurses )
  media-libs/libpng:0
  ~media-libs/libsdl-1.2.9999[joystick,openglhq,video,X]
  media-libs/sdl-net
  ~media-libs/sdl-sound-9999[flac,vorbis]"

RDEPEND+="
  printer? ( media-libs/freetype )
  dev-cpp/tbb
  dev-games/physfs[zip]
  media-libs/flac
  media-libs/openglide
  media-sound/fluidsynth
  net-libs/libpcap"

RDEPEND+="
  !games-emulation/dosbox"

DEPEND+="
  ${RDEPEND}
  virtual/pkgconfig"

AM_OPTS="--include-deps"

S="${WORKDIR}"

pkg_nofetch() {
  einfo "To install DOSBox SVN Daum, manually download \"source.7z\" from"
  einfo "http://ykhwong.x-y.net/xe/?module=file&act=procFileDownload&file_srl=1346&sid=a25a3c7cdc5c2e99ee3d8821935bbd16"
  einfo "and move such file to \"${DISTDIR}/${SRC_URI}\"."
  einfo "Ensure such file is owned by \"portage:portage\" with permission bits 644!"
  einfo "Unfortunately, Javascript on ykhwong's site prohibits automated retrieval."
}

pkg_pretend() {
  einfo "Before compiling DOSBox SVN Daum, you *MUST* edit \"/usr/include/GL/gl.h\"."
  einfo "Temporarily comment out all function definitions from glActiveTextureARB() to"
  einfo "glMultiTexCoord4svARB() by prefixing the former with \"/*\" and suffixing the"
  einfo "latter with \"*/\": e.g.,"
  einfo
  einfo "    /*"
  einfo "    GLAPI void GLAPIENTRY glActiveTextureARB(GLenum texture);"
  einfo "    ..."
  einfo "    GLAPI void GLAPIENTRY glMultiTexCoord4svARB(GLenum target, const GLshort *v);"
  einfo "    */"
  einfo
  einfo "After installing DOSBox SVN Daum, you *MUST* undo your edits to this file."
  einfo
  einfo "Yes, this is blatantly terrible."
}

src_prepare() {
  epatch "${FILESDIR}/dosbox-0.74-gcc46.patch"
  eautoreconf
}

src_configure() {
  LIBS+=" -ltbb -lFLAC $(pkg-config --libs gthread-2.0)"
  CPPFLAGS+=" -I /usr/include/openglide/ $(pkg-config --cflags gthread-2.0)"

  use c++0x && CXXFLAGS+=" -std=c++0x -fpermissive"

  export LIBS CPPFLAGS CXXFLAGS

  egamesconf \
    --disable-dependency-tracking \
    --disable-shaders \
    $(use_enable alsa alsa-midi) \
    $(use_enable !hardened dynamic-core) \
    $(use_enable !hardened dynamic-x86) \
    $(use_enable debug) \
    $(use_enable opengl) \
    $(use_enable printer)
}

src_install() {
  default
  dodoc AUTHORS ChangeLog NEWS README THANKS
  make_desktop_entry dosbox DOSBox /usr/share/pixmaps/dosbox.ico
  doicon src/dosbox.ico
  prepgamesdirs
}

pkg_postinst() {
  elog "Don't forget to undo your edits to \"/usr/include/GL/gl.h\"!"
}

