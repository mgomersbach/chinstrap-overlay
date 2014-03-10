# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit versionator

DESCRIPTION="phploc is a tool for quickly measuring the size and analyzing the structure of a PHP project."
HOMEPAGE="http://getcomposer.org"

MY_PV=$(replace_version_separator _ -)

SRC_URI="https://phar.phpunit.de/phploc.phar -> ${PN}-${MY_PV}.phar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/php-5.3.4"
RDEPEND="dev-lang/php[zip]"

src_unpack() {
  cp "${DISTDIR}/${A}" "${WORKDIR}"
  S=${WORKDIR}
}

src_install() {
  mv "${WORKDIR}/${A}" "${WORKDIR}/phploc"
  dobin phploc
}
