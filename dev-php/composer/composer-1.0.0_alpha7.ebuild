# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="4"

inherit versionator

DESCRIPTION="A dependancy manager for PHP"
HOMEPAGE="http://getcomposer.org"

MY_PV=$(replace_version_separator _ -)

SRC_URI="http://getcomposer.org/download/${MY_PV}/composer.phar -> ${PN}-${MY_PV}.phar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/php-5.3.4"
RDEPEND="dev-lang/php[phar,zip]"

S=${WORKDIR}

src_unpack() {
		return
        #mv "${DISTDIR}/${A}" "${WORKDIR}"
}

#src_install() {
#        mv "${WORKDIR}/${A}" "${WORKDIR}/composer"
#        dobin composer
#}
src_install() {
	insinto /usr/share/php/composer
	insopts -m755
	newins "${DISTDIR}"/${PN}-${MY_PV}.phar composer.phar
	dosym /usr/share/php/composer/composer.phar /usr/bin/composer
}
