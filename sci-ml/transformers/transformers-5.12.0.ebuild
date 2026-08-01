# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )
inherit distutils-r1 pypi

DESCRIPTION="State-of-the-art machine learning for PyTorch, TensorFlow, and JAX"
HOMEPAGE="
	https://github.com/huggingface/transformers
	https://pypi.org/project/transformers/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/filelock[${PYTHON_USEDEP}]
	>=dev-python/huggingface-hub-1.5.0[${PYTHON_USEDEP}]
	<dev-python/huggingface-hub-2.0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/regex-2025.10.22[${PYTHON_USEDEP}]
	dev-python/typer[${PYTHON_USEDEP}]
	>=sci-ml/safetensors-0.4.3[${PYTHON_USEDEP}]
	>=sci-ml/tokenizers-0.22.0[${PYTHON_USEDEP}]
	<sci-ml/tokenizers-0.24[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.27[${PYTHON_USEDEP}]
"
