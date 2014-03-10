# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_MODULE="sensors"
PYTHON_MODNAME="sensors"

inherit distutils-r1

MY_PN="PySensors"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python bindings to libsensors (via ctypes)"
HOMEPAGE="http://pypi.python.org/pypi/PySensors/"
SRC_URI="https://pypi.python.org/packages/source/P/PySensors/${MY_P}.tar.gz"

LICENSE="MIT"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""

RDEPEND="sys-apps/lm_sensors"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

