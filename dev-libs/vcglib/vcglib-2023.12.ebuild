# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Visual Computing Lab's C++ library for 3D processing (header-only)"
HOMEPAGE="https://github.com/cnr-isti-vclab/vcglib"
SRC_URI="https://github.com/cnr-isti-vclab/vcglib/archive/refs/tags/${PV}.tar.gz -> vcglib-${PV}.tar.gz"
S="${WORKDIR}/vcglib-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	# Install headers from vcg/ to /usr/include/vcg/
	insinto /usr/include
	doins -r vcg || die "Failed to install vcg headers"

	# Install wrap/callback.h to /usr/include/wrap/
	insinto /usr/include
	doins -r wrap || die "Failed to install wrap headers"

	dodoc README.md || die
}
