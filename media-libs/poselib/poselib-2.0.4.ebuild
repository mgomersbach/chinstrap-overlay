# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

inherit cmake python-single-r1 flag-o-matic

DESCRIPTION="Library for solving minimal problems in geometric computer vision"
HOMEPAGE="https://github.com/PoseLib/PoseLib"
SRC_URI="https://github.com/PoseLib/PoseLib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/PoseLib-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python test"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RESTRICT="!test? ( test )"

DEPEND="
	dev-cpp/eigen:3
	python? (
		dev-python/pybind11
	)
"
RDEPEND="${DEPEND}
	python? ( ${PYTHON_DEPS} )"
BDEPEND="virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/0001-gcc13.patch
	"${FILESDIR}"/0002-werror.patch
)

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	filter-flags -Werror -Wno-ignored-optimization-argument '-Wno-error*'
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
		-DBUILD_SHARED_LIBS=ON
		-DPoseLib_BUILD_TESTS=$(usex test ON OFF)
		-DPoseLib_BUILD_PYTHON_BINDINGS=$(usex python ON OFF)
		-DPYTHON_EXECUTABLE=$(usex python "${PYTHON}" "")
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dodoc README.md

	if use python; then
		python_optimize
	fi
}
