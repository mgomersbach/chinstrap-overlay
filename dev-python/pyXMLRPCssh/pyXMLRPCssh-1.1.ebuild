# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=4

PYTHON_DEPEND="2:2.7"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.3 3.*"

inherit distutils

DESCRIPTION="${PN} is a Python library to provide XMLRPC over an SSH2 tunnel"
HOMEPAGE="https://pypi.python.org/pypi/${PN} http://${PN}.sourceforge.net"
S="${S}-0"
SRC_URI="mirror://sourceforge/${PN}/${PV}-0/${PN}-${PV}-0.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

RDEPEND="dev-python/paramiko"
DEPEND="${RDEPEND}"
