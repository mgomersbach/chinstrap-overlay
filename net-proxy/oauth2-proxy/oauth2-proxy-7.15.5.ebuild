# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="Reverse proxy that provides authentication with Google, Azure, OIDC and more"
HOMEPAGE="https://oauth2-proxy.github.io/oauth2-proxy/"
SRC_URI="https://github.com/oauth2-proxy/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
# upstream publishes no vendor tarball; go fetches modules during build
RESTRICT="strip network-sandbox"

RDEPEND="
	acct-group/oauth2-proxy
	acct-user/oauth2-proxy
"
BDEPEND=">=dev-lang/go-1.26.0"

src_compile() {
	ego build \
		-ldflags="-X github.com/oauth2-proxy/oauth2-proxy/v7/pkg/version.VERSION=v${PV}" \
		-o "${PN}" .
}

src_install() {
	dobin "${PN}"

	insinto /etc/oauth2-proxy
	newins contrib/oauth2-proxy.cfg.example oauth2-proxy.cfg.example

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	systemd_newunit contrib/oauth2-proxy.service.example oauth2-proxy.service

	einstalldocs
}

pkg_postinst() {
	elog "Copy /etc/oauth2-proxy/oauth2-proxy.cfg.example to"
	elog "/etc/oauth2-proxy/oauth2-proxy.cfg and configure your provider,"
	elog "cookie secret and upstreams before starting the service."
}
