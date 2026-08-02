# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="Model swapping proxy for llama.cpp and other OpenAI-compatible servers"
HOMEPAGE="https://github.com/mostlygeek/llama-swap"
SRC_URI="https://github.com/mostlygeek/llama-swap/releases/download/v${PV}/llama-swap_${PV}_linux_amd64.tar.gz -> ${P}-linux-amd64.tar.gz"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="systemd"

RDEPEND="
	acct-group/${PN}
	acct-user/${PN}
"

# Upstream static Go binary; source builds need an npm-built web UI.
QA_PREBUILT="usr/bin/${PN}"
RESTRICT="strip"

src_install() {
	dobin ${PN}

	insinto /etc/${PN}
	doins "${FILESDIR}/config.yaml"

	if use systemd; then
		systemd_dounit "${FILESDIR}/${PN}.service"
	else
		newinitd "${FILESDIR}/${PN}.init" ${PN}
		newconfd "${FILESDIR}/${PN}.confd" ${PN}
	fi

	keepdir /var/lib/${PN}
	fowners ${PN}:${PN} /var/lib/${PN}
	fperms 0700 /var/lib/${PN}

	keepdir /var/log/${PN}
	fowners ${PN}:${PN} /var/log/${PN}
	fperms 0755 /var/log/${PN}
}

pkg_postinst() {
	elog "Define your models in /etc/${PN}/config.yaml (listens on :8080)."
	elog "Model files must be readable by the ${PN} user."
	elog "Extra flags go in /etc/conf.d/${PN} (LLAMA_SWAP_OPTS)."
	if use systemd; then
		elog "Start with: systemctl enable --now ${PN}"
	else
		elog "Start with: rc-update add ${PN} default && rc-service ${PN} start"
	fi
}
