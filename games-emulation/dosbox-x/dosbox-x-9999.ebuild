# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools flag-o-matic git-r3

DESCRIPTION="A fork of DOSBox"
HOMEPAGE="http://dosbox-x.com/"
EGIT_REPO_URI="https://github.com/joncampbell123/dosbox-x.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa debug glide hardened ffmpeg opengl"

PATCHES=(
	"${FILESDIR}/${P}-repair-zlib-macro-namespace.patch"
)

DEPEND="alsa? ( media-libs/alsa-lib )
	ffmpeg? ( media-video/ffmpeg )
	opengl? ( virtual/glu virtual/opengl )
	debug? ( sys-libs/ncurses:0 )
	dev-games/physfs
	media-libs/libpng:0=
	media-libs/libsdl[joystick,video,X]
	media-libs/sdl-net
	media-libs/sdl-sound
	glide? ( media-libs/openglide )"
RDEPEND=${DEPEND}

if [[ ${PV} = 9999 ]]; then
	S=${WORKDIR}/dosbox-x-9999
fi

src_prepare() {
	eautoreconf
	chmod +x vs2015/sdl/build-scripts/strip_fPIC.sh
	default
}

src_configure() {
	# Prefer to compile against the internal copy of SDL 1.x
	(cd vs2015/sdl && ./build-dosbox.sh) || exit 1

	chmod +x configure
	econf \
		$(use_enable alsa alsa-midi) \
		$(use_enable ffmpeg avcodec) \
		$(use_enable !hardened dynamic-core) \
		$(use_enable !hardened dynamic-x86) \
		$(use_enable debug) \
		$(use_enable glide) \
		$(use_enable opengl)
}

src_compile() {
	emake
}
