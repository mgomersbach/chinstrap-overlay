# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

POSTGRES_COMPAT=( {13..18} )
POSTGRES_USEDEP="server"

inherit postgres-multi

DESCRIPTION="Open-source vector similarity search for Postgres"
HOMEPAGE="https://github.com/pgvector/pgvector"
SRC_URI="https://github.com/pgvector/pgvector/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="POSTGRESQL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="${POSTGRES_DEP}"
RDEPEND="${DEPEND}"

# Tests need a running PostgreSQL server
RESTRICT="test"

src_prepare() {
	# Respect user CFLAGS instead of upstream's -march=native
	sed -i 's/^OPTFLAGS = .*/OPTFLAGS =/' Makefile || die
	postgres-multi_src_prepare
}
