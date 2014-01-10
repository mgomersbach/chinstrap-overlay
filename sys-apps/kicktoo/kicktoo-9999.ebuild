# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=5

EGIT_REPO_URI="http://git.gomersbach.nl/mgomersbach/kicktoo.git"
[ -n "${EVCS_OFFLINE}" ] || EGIT_REPACK=true
inherit eutils git-2

DESCRIPTION="A Portage based installer/profiler for Gentoo/Funtoo/Gomersbach"
HOMEPAGE="https://github.com/r1k0/kicktoo"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE="crypt doc examples server"
RDEPEND="sys-block/parted
	net-misc/curl
	crypt? (
		dev-libs/libgcrypt
		dev-libs/popt
		dev-libs/libgpg-error
		sys-apps/util-linux
		sys-fs/cryptsetup
	)
	server? (
		dev-perl/HTTP-Daemon
	)"
S=${WORKDIR}/kicktoo


src_install() {
	ktdir=/usr/share/kicktoo

	insinto ${ktdir}/modules
	doins modules/*
	dobin kicktoo

	if use server; then
		dobin daemon/kicktood
		insinto /etc/kicktoo
		doins daemon/kicktood.conf
	fi

	if use doc; then
		dodoc README
		dodoc TODO
		newdoc profiles/config.txt profile-config.txt
	fi

	if use examples; then
		insinto ${ktdir}/kbin
		doins kbin/*
		insinto ${ktdir}/kconfig
		doins kconfig/*
		insinto ${ktdir}/profiles
		rm profiles/config.txt
		doins -r profiles/*
	fi
}
