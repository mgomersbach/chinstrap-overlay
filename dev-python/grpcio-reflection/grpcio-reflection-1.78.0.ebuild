# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Standard Protobuf Reflection Service for gRPC"
HOMEPAGE="
	https://grpc.io/
	https://pypi.org/project/grpcio-reflection/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/protobuf-6.31.1[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.78.0[${PYTHON_USEDEP}]
"
