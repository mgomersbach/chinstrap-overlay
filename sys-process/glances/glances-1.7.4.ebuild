# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

MY_PN="Glances"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A cross-platform curses-based monitoring tool"
HOMEPAGE="https://github.com/nicolargo/glances"
SRC_URI="https://pypi.python.org/packages/source/G/Glances/${MY_P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE="doc batinfo html sensors"

DEPEND="dev-python/setuptools"
RDEPEND=">=dev-python/psutil-0.5.1
	batinfo? ( dev-python/batinfo )
	dev-python/setuptools
	html? ( dev-python/jinja )
	sensors? ( dev-python/pysensors )"

S="${WORKDIR}/${MY_P}"

src_install() {
	distutils_src_install
	if use doc; then
		dodoc -r docs
	fi
}
