# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
PYPI_PN="ai-edge-litert"

inherit pypi python-single-r1

DESCRIPTION="LiteRT Python runtime (includes interpreter and delegate loader APIs)"
HOMEPAGE="https://github.com/google-ai-edge/LiteRT https://pypi.org/project/ai-edge-litert/"

SRC_URI="
	python_single_target_python3_12? ( $(pypi_wheel_url --unpack "${PYPI_PN}" "${PV}" "cp312" "cp312-manylinux_2_27_x86_64") )
	python_single_target_python3_13? ( $(pypi_wheel_url --unpack "${PYPI_PN}" "${PV}" "cp313" "cp313-manylinux_2_27_x86_64") )
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
"
BDEPEND="
	app-arch/unzip
"

S="${WORKDIR}"

QA_PREBUILT="
	usr/lib*/python*/site-packages/ai_edge_litert/*.so
	usr/lib*/python*/site-packages/ai_edge_litert/lib*.so
"

QA_PRESTRIPPED="
	usr/lib*/python*/site-packages/ai_edge_litert/*.so
	usr/lib*/python*/site-packages/ai_edge_litert/lib*.so
"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_install() {
	local sitedir="$(python_get_sitedir)"
	local pkgdir="${ED}${sitedir}/ai_edge_litert"

	dodir "${sitedir}" || die
	cp -a ai_edge_litert "${ED}${sitedir}/" || die
	cp -a ai_edge_litert-${PV}.dist-info "${ED}${sitedir}/" || die

	# Keep runtime/interpreter bits for inference; drop vendor AOT compiler plugins
	# that ship with embedded RPATHs and are not needed for Coral delegate usage.
	rm -rf "${pkgdir}/vendors" || die
	rm -f "${pkgdir}/tools/apply_plugin_main" || die

	python_optimize
}
