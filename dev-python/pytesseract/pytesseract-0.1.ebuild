# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Python-tesseract is a python wrapper for google's Tesseract-OCR"
HOMEPAGE="https://github.com/madmaze/python-tesseract"
SRC_URI="https://pypi.python.org/packages/source/p/pytesseract/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools
app-text/tesseract"
RDEPEND="${DEPEND}"


