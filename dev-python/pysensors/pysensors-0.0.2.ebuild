# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

MY_PN="PySensors"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python bindings to libsensors (via ctypes)"
HOMEPAGE="http://pypi.python.org/pypi/PySensors/"
SRC_URI="https://pypi.python.org/packages/source/P/PySensors/${MY_P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""


S="${WORKDIR}/${MY_P}"
PYTHON_MODNAME="sensors"

