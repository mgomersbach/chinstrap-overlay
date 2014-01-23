# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:
EAPI=5

PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.5 3.*"
DISTUTILS_SRC_TEST="nosetests"

EGIT_REPO_URI="https://github.com/freeyoung/g-pypi.git"
[ -n "${EVCS_OFFLINE}" ] || EGIT_REPACK=true
inherit eutils git-2 confutils distutils

DESCRIPTION="g-pypi manages ebuilds for Gentoo Linux using information in PyPi (Python Package Index)"
HOMEPAGE="https://github.com/iElectric/g-pypi https://github.com/freeyoung/g-pypi"
SRC_URI=""

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="doc test"

DEPEND="
    dev-python/setuptools
    doc? (
        dev-python/sphinx
    )
    test? (
        dev-python/mock
        dev-python/mocker
        dev-python/scripttest
    )
"
# dev-python/unittest2 may not be necessary, bug #450648
RDEPEND="
    app-portage/gentoolkit
    app-portage/gentoolkit-dev
    app-portage/metagen
    >=dev-python/jaxml-3.02
    dev-python/setuptools
    dev-python/jinja
    dev-python/pygments
    dev-python/sphinxcontrib-googleanalytics
    dev-python/unittest2
    dev-python/yolk
    virtual/python-argparse
"

PYTHON_MODNAME="gpypi"

src_prepare() {
    distutils_src_prepare
}

src_compile() {
    distutils_src_compile
    use doc && emake -C docs html
}

src_install() {
    distutils_src_install
    use doc && dohtml -r docs/build/html/*
}



