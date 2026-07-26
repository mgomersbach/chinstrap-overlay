# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="HA template for PostgreSQL with ZooKeeper, etcd, or Consul"
HOMEPAGE="
	https://github.com/patroni/patroni/
	https://pypi.org/project/patroni/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="+consul aws"

RDEPEND="
	dev-db/postgresql:*
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/prettytable[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/ydiff[${PYTHON_USEDEP}]
	dev-python/psycopg[${PYTHON_USEDEP}]
	consul? ( dev-python/python-consul[${PYTHON_USEDEP}] )
	aws? ( dev-python/boto3[${PYTHON_USEDEP}] )
"

# Patroni's test suite spins up a real postgres + etcd/consul cluster
# and is flaky outside their CI; trust the upstream release process.
# distutils-r1 adds `test` to IUSE implicitly, so RESTRICT is enough
# to keep buildbots from trying.
RESTRICT="test"

src_install() {
	distutils-r1_src_install
	newinitd "${FILESDIR}/patroni.initd" patroni
	newconfd "${FILESDIR}/patroni.confd" patroni
	keepdir /etc/patroni
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Patroni installed. To finish setting up a cluster:"
		elog "  1. Drop a config at /etc/patroni/patroni.yml (the upstream"
		elog "     example lives at /usr/share/doc/${PF}/postgres0.yml.bz2)."
		elog "  2. Make sure dev-db/postgresql:<slot> is installed but NOT"
		elog "     in any runlevel — Patroni manages the postgres process"
		elog "     itself."
		elog "  3. rc-update add patroni default; rc-service patroni start"
		elog
		elog "If you use Consul as the DCS, make sure app-admin/consul is"
		elog "in a runlevel before patroni — the included openrc init"
		elog "uses 'use consul' so consul agent presence is preferred but"
		elog "not strictly required at boot."
	fi
}
