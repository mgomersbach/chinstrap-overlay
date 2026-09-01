# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,14} )
inherit distutils-r1 pypi
DESCRIPTION="Peer-to-peer protocol for voice assistants (Wyoming, HA/Rhasspy)"
HOMEPAGE="https://github.com/OHF-Voice/wyoming https://pypi.org/project/wyoming/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
