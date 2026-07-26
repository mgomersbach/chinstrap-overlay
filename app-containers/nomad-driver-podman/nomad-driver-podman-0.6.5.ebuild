# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Nomad task driver plugin for sandboxing workloads in podman containers"
HOMEPAGE="https://github.com/hashicorp/nomad-driver-podman"
SRC_URI="https://github.com/hashicorp/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
# upstream publishes no vendor tarball; go fetches modules during build
RESTRICT="strip network-sandbox"

RDEPEND="
	app-containers/podman
	sys-cluster/nomad
"
BDEPEND=">=dev-lang/go-1.25.8"

src_compile() {
	ego build -o "${PN}" .
}

src_install() {
	exeinto /usr/lib/nomad/plugins
	doexe "${PN}"
	einstalldocs
}

pkg_postinst() {
	elog "Point nomad's plugin_dir at /usr/lib/nomad/plugins, e.g.:"
	elog '  plugin_dir = "/usr/lib/nomad/plugins"'
	elog 'and enable the driver with a plugin "nomad-driver-podman" stanza.'
}
