# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3_11 python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Term-based tool to view colored, incremental diff in unified format"
HOMEPAGE="
	https://github.com/ymattw/ydiff/
	https://pypi.org/project/ydiff/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~riscv ~x86"

# Test suite is interactive (uses TTY-aware paging logic). Skip.
RESTRICT="test"
