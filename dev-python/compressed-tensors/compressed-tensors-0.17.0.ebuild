# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )
inherit distutils-r1 pypi

DESCRIPTION="Library for utilization of compressed safetensors of neural network models"
HOMEPAGE="
	https://github.com/vllm-project/compressed-tensors
	https://pypi.org/project/compressed-tensors/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/loguru[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	')
	>=sci-ml/pytorch-2.10.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.45.0[${PYTHON_SINGLE_USEDEP}]
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools-scm[${PYTHON_USEDEP}]
	')
"
