# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils


DESCRIPTION="Plug and play continuous integration with django and jenkins"
HOMEPAGE="http://github.com/kmmbvnr/django-jenkins"
SRC_URI="https://pypi.python.org/packages/source/d/django-jenkins/${P}.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=">=dev-python/coverage-3.7
	>=dev-python/django-1.6
	>=dev-python/pylint-1.0
	dev-python/setuptools"


