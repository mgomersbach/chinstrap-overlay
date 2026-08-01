# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

inherit cmake python-any-r1

DESCRIPTION="Extension library for raylib expanding 3D capabilities"
HOMEPAGE="https://github.com/Bigfoot71/r3d"
SRC_URI="https://github.com/Bigfoot71/r3d/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE="assimp"

DEPEND="
	>=media-libs/raylib-5.5
	assimp? ( >=media-libs/assimp-6.0.2 )
"
RDEPEND="${DEPEND}"
BDEPEND="${PYTHON_DEPS}"

src_configure() {
	local mycmakeargs=(
		-DR3D_RAYLIB_VENDORED=OFF
		-DR3D_ASSIMP_VENDORED=OFF
		-DR3D_SUPPORT_ASSIMP=$(usex assimp)
		-DR3D_BUILD_EXAMPLES=OFF
		-DR3D_BUILD_DOCS=OFF
		-DBUILD_SHARED_LIBS=ON
	)
	cmake_src_configure
}

src_install() {
	dolib.so "${BUILD_DIR}/lib/libr3d.so"

	insinto /usr/include/r3d
	doins "${S}"/include/r3d/*.h

	einstalldocs
}
