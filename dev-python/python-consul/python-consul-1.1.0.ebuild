# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3_11 python3_{11..14} )

# python-consul 1.1.0 predates PEP 625 underscore-normalization on
# PyPI — the sdist filename is python-consul-1.1.0.tar.gz (hyphen).
# Keep the eclass from rewriting it.
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Python client for HashiCorp Consul"
HOMEPAGE="
	https://github.com/cablehead/python-consul/
	https://pypi.org/project/python-consul/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~riscv ~x86"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"

# Tests want a real consul agent + heavy mocking; not viable in
# build-time CI. Skip.
RESTRICT="test"
