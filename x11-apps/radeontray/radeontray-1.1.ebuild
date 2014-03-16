# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:
EAPI=5

inherit eutils confutils distutils

DESCRIPTION="A simple tray icon for controlling Radeon power profiles"
HOMEPAGE="https://github.com/StuntsPT/Radeon-tray/"
SRC_URI="https://github.com/StuntsPT/Radeon-tray/archive/v${PV}.tar.gz"
PN="Radeon-tray"
S="${WORKDIR}/${PN}-${PV}"
LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="
dev-python/PyQt4
dev-python/pyzmq
dev-python/setuptools
${DEPEND}
"

