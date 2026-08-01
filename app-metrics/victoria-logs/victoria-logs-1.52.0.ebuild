# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="Fast, resource-efficient log database from VictoriaMetrics"
HOMEPAGE="
	https://docs.victoriametrics.com/victorialogs/
	https://github.com/VictoriaMetrics/VictoriaLogs
"
SRC_URI="https://github.com/VictoriaMetrics/VictoriaLogs/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/VictoriaLogs-${PV}"

# Apache-2.0 for the project itself, the rest for vendored Go deps
LICENSE="Apache-2.0 BSD BSD-2 ISC MIT MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+cli systemd +utils"
RESTRICT="test"

RDEPEND="
	acct-group/${PN}
	acct-user/${PN}
"

src_prepare() {
	default
	# go.mod asks for a newer patch release of the same minor; harmless
	sed -i "s/^go 1\.26\.[0-9]*$/go $(go env GOVERSION | sed 's/^go//;s/-.*//')/" go.mod || die
}

src_compile() {
	local app apps=( victoria-logs )
	use cli && apps+=( vlogscli )
	use utils && apps+=( vlagent )
	for app in "${apps[@]}"; do
		ego build \
			-ldflags "-X github.com/VictoriaMetrics/VictoriaMetrics/lib/buildinfo.Version=${app}-v${PV}" \
			./app/${app}
	done
}

src_install() {
	dobin victoria-logs
	use cli && dobin vlogscli
	use utils && dobin vlagent

	if use systemd; then
		systemd_dounit "${FILESDIR}/${PN}.service"
		use utils && systemd_dounit "${FILESDIR}/vlagent.service"
	else
		newinitd "${FILESDIR}/${PN}.init" ${PN}
		newconfd "${FILESDIR}/${PN}.confd" ${PN}
		if use utils; then
			newinitd "${FILESDIR}/vlagent.init" vlagent
			newconfd "${FILESDIR}/vlagent.confd" vlagent
		fi
	fi

	keepdir /var/lib/${PN}
	fowners ${PN}:${PN} /var/lib/${PN}
	fperms 0700 /var/lib/${PN}

	keepdir /var/log/${PN}
	fowners ${PN}:${PN} /var/log/${PN}
	fperms 0755 /var/log/${PN}
}

pkg_postinst() {
	elog "VictoriaLogs stores data in /var/lib/${PN}/data (HTTP API on :9428)."
	elog "Extra flags go in /etc/conf.d/${PN} (VICTORIA_LOGS_OPTS)."
	if use systemd; then
		elog "Start with: systemctl enable --now ${PN}"
	else
		elog "Start with: rc-update add ${PN} default && rc-service ${PN} start"
	fi
	if use utils; then
		elog ""
		elog "vlagent (edge log shipper) installed alongside its service unit."
		elog "Set -remoteWrite.url in /etc/conf.d/vlagent (VLAGENT_OPTS), then"
		elog "enable the 'vlagent' service where you want to collect + ship logs."
	fi
}
