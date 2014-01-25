# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="5"

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

EGIT_REPO_URI="https://github.com/adamn/python-webkit2png.git"
[ -n "${EVCS_OFFLINE}" ] || EGIT_REPACK=true

inherit distutils git-2


DESCRIPTION="Takes snapshot of webpages using Webkit and Qt4"
HOMEPAGE="http://github.com/AdamN/python-webkit2png"
if [[ $PV = 9999* ]]; then
  SRC_URI=""
else
  SRC_URI="https://pypi.python.org/packages/source/w/webkit2png/${P}.tar.gz"
fi


LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools
        dev-python/PyQt4
        dev-qt/qtwebkit
        x11-base/xorg-server[xvfb]"
RDEPEND="${DEPEND}"
