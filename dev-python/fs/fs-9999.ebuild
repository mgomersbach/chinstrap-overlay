# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils
inherit subversion

DESCRIPTION="File system abstraction for Python"
HOMEPAGE="http://code.google.com/p/pyfilesystem/"
#SRC_URI="http://pyfilesystem.googlecode.com/files/fs-0.4.0.tar.gz"
ESVN_REPO_URI="http://pyfilesystem.googlecode.com/svn/trunk/"
ESVN_PROJECT="pyfilesystem"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"

RESTRICT_PYTHON_ABIS="3*"
