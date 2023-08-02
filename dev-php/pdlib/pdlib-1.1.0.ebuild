# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_PHP="php8-0 php8-1 php8-2"
PHP_TARGETS="php8-0 php8-1 php8-2"
PHP_EXT_NAME="pdlib"

inherit php-ext-source-r3

DESCRIPTION="PHP extension for Dlib's Machine Learning Toolkit"
HOMEPAGE="https://github.com/goodspb/pdlib"

LICENSE="MIT"
SRC_URI="https://github.com/goodspb/pdlib/archive/refs/tags/v${PV}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
    >=sci-libs/dlib-19.24
    "

src_prepare() {
    default
    php-ext-source-r3_src_prepare
}
