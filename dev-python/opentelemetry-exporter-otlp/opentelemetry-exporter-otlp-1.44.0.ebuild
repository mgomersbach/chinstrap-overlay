# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="OpenTelemetry Collector Exporters"
HOMEPAGE="
	https://github.com/open-telemetry/opentelemetry-python
	https://pypi.org/project/opentelemetry-exporter-otlp/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# Note: opentelemetry-exporter-otlp-proto-grpc and
# opentelemetry-exporter-otlp-proto-http are not in ::gentoo.
# They must be provided by an overlay.
RDEPEND="
	~dev-python/opentelemetry-exporter-otlp-proto-grpc-${PV}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-exporter-otlp-proto-http-${PV}[${PYTHON_USEDEP}]
"
