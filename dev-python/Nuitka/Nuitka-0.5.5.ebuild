# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2 3"

inherit flag-o-matic eutils distutils

DESCRIPTION="Python compiler with full language support and CPython compatibility"
HOMEPAGE="http://nuitka.net"
SRC_URI="http://nuitka.net/releases/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc"

strip-flags

src_install() {
  distutils_src_install

  if use doc; then
    dodoc -r doc/*
  fi
}
