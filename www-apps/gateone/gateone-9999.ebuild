# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

EGIT_REPO_URI="https://github.com/liftoff/GateOne.git"
[ -n "${EVCS_OFFLINE}" ] || EGIT_REPACK=true
inherit eutils git-2 confutils distutils

DESCRIPTION="an HTML5-powered terminal emulator and SSH client"
HOMEPAGE="https://github.com/liftoff/GateOne"
SRC_URI=""

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dtach kerberos pam slimit cssmin mutagen"

DEPEND=">=www-servers/tornado-3.0"
RDEPEND="${DEPEND}
  virtual/python-imaging
  virtual/python-futures
  dtach? ( app-misc/dtach )
  kerberos? ( dev-python/pykerberos )
  slimit? ( dev-python/slimit )
  cssmin? ( dev-python/cssmin )
  mutagen? ( media-libs/mutagen )
  pam? ( dev-python/python-pam )"

S="${WORKDIR}/GateOne"
