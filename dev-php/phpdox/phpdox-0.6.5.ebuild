# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit php-pear-r1 depend.php

DESCRIPTION="Documentation generator for PHP Code using standard technology (SRC, DOCBLOCK, XML and XSLT)"
HOMEPAGE="http://phpdox.de/"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/php-5.5.0"
RDEPEND="dev-lang/php[zip]"
S=""

src_unpack() { :;}
src_install() { :;}

pkg_postinst() {
  # Update PEAR/PECL channels as needed, add new ones to the list if needed
  elog "Updating PEAR/PECL channels"
  local pearchans="nikic.github.com/pear"

  for chan in ${pearchans} ; do
    pear channel-discover ${chan}
    pear channel-update ${chan}
  done
  pear install channel://nikic.github.com/pear/PHPParser-0.9.3
}
