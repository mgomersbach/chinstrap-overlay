# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Efficient, flexible, and portable structured generation library"
HOMEPAGE="
	https://xgrammar.mlc.ai/
	https://github.com/mlc-ai/xgrammar
	https://pypi.org/project/xgrammar/
"
SRC_URI="$(pypi_sdist_url)"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# TODO: torch dependency is complex; sci-ml/pytorch is single-impl
# while this package is multi-impl. Install pytorch separately.
RDEPEND="
	dev-python/pydantic[${PYTHON_USEDEP}]
	>=sci-ml/transformers-4.38.0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.9.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-build/cmake
	>=dev-python/scikit-build-core-0.10.0[${PYTHON_USEDEP}]
	dev-python/nanobind[${PYTHON_USEDEP}]
"

RESTRICT="test"
