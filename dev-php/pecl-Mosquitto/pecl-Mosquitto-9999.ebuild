# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#

EAPI="4"

PHP_EXT_NAME="Mosquitto"
PHP_EXT_PECL_PKG="Mosquitto"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
USE_PHP="php5-5 php5-4"

#PHP_EXT_INIFILE="${PN}.ini"

inherit php-ext-pecl-r2 git-2 eutils confutils


KEYWORDS="~amd64 ~x86"

DESCRIPTION="A wrapper for the Mosquitto MQTT client library for PHP."
EGIT_REPO_URI="git://github.com/mgdm/Mosquitto-PHP.git"
EGIT_BRANCH="async"
SRC_URI=""
LICENSE="BSD"
SLOT="0"

DEPEND="app-misc/mosquitto"
RDEPEND="${DEPEND}"

#S=${WORKDIR}/Mosquitto-9999
#PHP_EXT_S=${S}
#DOCSDIR=${WORKDIR}/${PECL_PKG_V}

# upstream does not ship any testsuite, so the PHPize test-runner fails.
RESTRICT='test'

src_unpack() {
        git-2_src_unpack
        local slot orig_s="$S"
        for slot in $(php_get_slots); do
	        cp -r "${orig_s}" "${WORKDIR}/${slot}"
        done
}

src_prepare() {
	for slot in $(php_get_slots) ; do
		php_init_slot_env ${slot}
		phpize && aclocal && libtoolize --force && autoheader && autoconf
	   	#php-ext-source-r2_src_prepare
	done
}

src_configure() {
	for slot in $(php_get_slots) ; do
		php_init_slot_env ${slot}
	    php-ext-source-r2_src_configure
	done
}

src_compile() {
	for slot in $(php_get_slots) ; do
		php_init_slot_env ${slot}
		php-ext-pecl-r2_src_compile
	done
}

src_install() {
	for slot in $(php_get_slots) ; do
		php_init_slot_env ${slot}
		mv "${WORKDIR}/${slot}/modules/mosquitto.so" "${WORKDIR}/${slot}/modules/Mosquitto.so"
		doins "${WORKDIR}/${slot}/modules/Mosquitto.so"
	    php-ext-pecl-r2_src_install
	done
}

#src_configure() {
#	local slot orig_s="${PHP_EXT_S}"
#	for slot in $(php_get_slots); do
#		cd "${WORKDIR}/${slot}"
#    	php-ext-source-r2_src_configure
#	done
#}

#src_install() {
#	local slot orig_s="${PHP_EXT_S}"
#	for slot in $(php_get_slots); do
#		cd "${WORKDIR}/${slot}"
#		php-ext-source-r2_src_install
#	done
#}
