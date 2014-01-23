# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Retrieving and setting network device settings"
HOMEPAGE="http://pypi.python.org/pypi/pynetinfo/ https://github.com/ico2/pynetinfo"
SRC_URI="mirror://pypi/p/pynetinfo/Pynetinfo-${PV}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"/Pynetinfo-${PV}
