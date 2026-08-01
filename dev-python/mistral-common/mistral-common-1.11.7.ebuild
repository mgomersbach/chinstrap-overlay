# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )
inherit distutils-r1 pypi

DESCRIPTION="A library of common utilities for Mistral AI"
HOMEPAGE="
	https://github.com/mistralai/mistral-common
	https://pypi.org/project/mistral-common/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/jsonschema-4.21.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.25[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.3.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7[${PYTHON_USEDEP}]
	>=dev-python/pydantic-extra-types-2.10.5[${PYTHON_USEDEP},pycountry]
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.11.0[${PYTHON_USEDEP}]
"
