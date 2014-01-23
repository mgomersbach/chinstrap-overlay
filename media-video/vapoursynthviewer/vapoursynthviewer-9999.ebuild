# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=4

DESCRIPTION="VSViewer is a simple program for editing and previewing VapourSynth scripts."
HOMEPAGE="https://github.com/dubhater/vapoursynth-viewer"
SRC_URI=""

EGIT_REPO_URI="https://github.com/dubhater/vapoursynth-viewer.git"
[ -n "${EVCS_OFFLINE}" ] || EGIT_REPACK=true
inherit eutils git-2 confutils

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""

RDEPEND="=media-video/vapoursynth-9999"
DEPEND="${RDEPEND}"
