# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools toolchain-funcs xdg

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/joncampbell123/dosbox-x.git"
else
	SRC_URI="https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${PV}.tar.gz"
	S="${WORKDIR}/${PN}-${PN}-v${PV}"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Complete, accurate DOS emulator forked from DOSBox"
HOMEPAGE="https://dosbox-x.com/"

LICENSE="GPL-2"
SLOT="0"

IUSE="X debug ffmpeg fluidsynth opengl png slirp truetype"
RESTRICT="!debug? ( test )"

BDEPEND="
	dev-lang/nasm
	sys-libs/libcap
"

COMMON_DEPEND="
	dev-lang/duktape:=
	media-libs/alsa-lib
	media-libs/libsdl2[X,alsa,opengl?,sound,threads(+),video]
	media-libs/sdl2-net
	net-libs/libpcap
	virtual/zlib:=
	X? (
		x11-libs/libX11
		x11-libs/libXrandr
		x11-libs/libxkbfile
	)
	debug? ( sys-libs/ncurses:= )
	ffmpeg? ( media-video/ffmpeg:= )
	fluidsynth? ( media-sound/fluidsynth:= )
	opengl? ( media-libs/libglvnd[X] )
	png? ( media-libs/libpng:= )
	slirp? ( net-libs/libslirp )
	truetype? ( media-libs/freetype )
"

DEPEND="
	${COMMON_DEPEND}
"

FILE_DIALOG_DEPEND="
	|| (
		gnome-extra/zenity
		kde-apps/kdialog
		x11-misc/xdialog
	)
"

RDEPEND="
	${COMMON_DEPEND}
	${FILE_DIALOG_DEPEND}
"

pkg_pretend() {
	if use ffmpeg && use !png; then
		ewarn "Setting the 'ffmpeg' USE flag when the 'png' USE flag is"
		ewarn "unset does not have any effect.  Unsetting the 'png' USE"
		ewarn "flag disables the video capture feature, so additional"
		ewarn "video capture formats enabled by the 'ffmpeg' USE flag"
		ewarn "will end up being unused."
	fi
}

src_prepare() {
	default

	sed -i -E -e 's/((C|CXX)FLAGS=.*-O)/: \1/' configure.ac ||
		die "Failed to stop configure.ac from touching '-O*' compiler flags"

	eautoreconf
}

src_configure() {
	local myconf=(
		--enable-sdl2
		--enable-alsa-midi

		$(use_enable debug '' heavy)

		$(use_enable X x11)
		$(use_enable ffmpeg avcodec)
		$(use_enable fluidsynth libfluidsynth)
		$(use_enable opengl)
		$(use_enable png screenshots)
		$(use_enable slirp libslirp)
		$(use_enable truetype freetype)
	)

	econf "${myconf[@]}"
}

src_compile() {
	# https://bugs.gentoo.org/856352
	emake AR="$(tc-getAR)"
}

src_test() {
	xdg_environment_reset # Tests may create config files in XDG_CONFIG_HOME
	set -- src/dosbox-x -tests
	echo "${@}" >&2
	"${@}" || die "Unit tests failed"
}

pkg_preinst() {
	xdg_pkg_preinst

	newuse() {
		local flag="${1}"
		use "${flag}" && ! has_version "${CATEGORY}/${PN}[${flag}]"
	}

	newuse debug && PRINT_NOTES_FOR_DEBUGGER=1
	newuse fluidsynth && PRINT_NOTES_FOR_FLUIDSYNTH=1
}

pkg_postinst() {
	xdg_pkg_postinst

	if [[ "${PRINT_NOTES_FOR_DEBUGGER}" ]]; then
		elog
		elog "Note on the Debugger"
		elog
		elog "The debugger can only be started when DOSBox-X is launched"
		elog "from a terminal.  Otherwise, the \"Start DOSBox-X Debugger\""
		elog "option in the \"Debug\" drop-down menu would be unavailable."
		elog
		elog "For more information about the debugger, please consult:"
		elog "  ${EPREFIX}/usr/share/doc/${PF}/README.debugger*"
	fi

	if [[ "${PRINT_NOTES_FOR_FLUIDSYNTH}" ]]; then
		elog
		elog "Note on FluidSynth"
		elog
		elog "To use FluidSynth as the MIDI device for DOSBox-X, a soundfont"
		elog "is required.  If no existing soundfont is available, a new one"
		elog "can be installed and configured for DOSBox-X very easily:"
		elog
		elog "1. Install the following package:"
		elog "     media-sound/fluid-soundfont"
		elog "2. Add the following lines to DOSBox-X's configuration file:"
		elog "     [midi]"
		elog "     mididevice=fluidsynth"
		elog
		elog "Usually, there is no need to explicitly specify the soundfont"
		elog "file's path because the package mentioned in step 1 installs"
		elog "soundfont files to a standard location, allowing them to be"
		elog "detected and selected automatically."
		elog
		elog "For advanced FluidSynth configuration, please consult:"
		elog "  https://dosbox-x.com/wiki/Guide%3ASetting-up-MIDI-in-DOSBox%E2%80%90X#_fluidsynth"
	fi
}
