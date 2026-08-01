# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

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

# torch and transformers are required upstream but omitted here;
# they are pulled in by vllm which is the primary consumer.
RDEPEND="
	dev-python/loguru[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	sci-ml/transformers[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"
