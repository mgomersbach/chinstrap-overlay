# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_SINGLE_IMPL=1
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

# triton_kernels is a pure Python subpackage inside the upstream triton
# source tree (python/triton_kernels/).
TRITON_PV="3.6.0"

DESCRIPTION="Triton kernels for ML model acceleration"
HOMEPAGE="https://github.com/triton-lang/triton"
SRC_URI="https://github.com/triton-lang/triton/archive/refs/tags/v${TRITON_PV}.tar.gz -> triton-${TRITON_PV}.tar.gz"

S="${WORKDIR}/triton-${TRITON_PV}/python/triton_kernels"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	|| (
		dev-python/triton[${PYTHON_SINGLE_USEDEP}]
	)
"
BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/setuptools-64.0[${PYTHON_USEDEP}]
	')
"
