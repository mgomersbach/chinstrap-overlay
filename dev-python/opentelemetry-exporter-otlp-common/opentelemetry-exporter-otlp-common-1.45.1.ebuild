# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1

# upstream versions this as 0.xxbN; like opentelemetry-semantic-conventions
# in ::gentoo it follows the opentelemetry-python release tag instead
MY_P="opentelemetry-python-${PV}"
DESCRIPTION="OpenTelemetry OTLP HTTP export utilities"
HOMEPAGE="
	https://opentelemetry.io/
	https://pypi.org/project/opentelemetry-exporter-otlp-common/
	https://github.com/open-telemetry/opentelemetry-python/
"
SRC_URI="
	https://github.com/open-telemetry/opentelemetry-python/archive/refs/tags/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S="${WORKDIR}/${MY_P}/exporter/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
	~dev-python/opentelemetry-sdk-${PV}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-semantic-conventions-${PV}[${PYTHON_USEDEP}]
"
# the http transport is an optional extra upstream (only a type import here);
# proto-http depends on it directly, the tests install it from this tarball

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

python_test() {
	cp -a "${BUILD_DIR}"/{install,test} || die
	local -x PATH=${BUILD_DIR}/test/usr/bin:${PATH}

	for dep in exporter/opentelemetry-exporter-http-transport; do
		pushd "${WORKDIR}/${MY_P}/${dep}" >/dev/null || die
		distutils_pep517_install "${BUILD_DIR}"/test
		popd >/dev/null || die
	done

	epytest
}
