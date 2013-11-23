# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils

DESCRIPTION="A clean, resource friendly and easy to use API for thetvdb.com"
HOMEPAGE="https://github.com/fuzzycode/pytvdbapi"
SRC_URI="https://pypi.python.org/packages/source/p/pytvdbapi/${P}.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/httplib2
	dev-python/setuptools"
