# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5
PYTHON_DEPEND="2:2.5"

inherit git-2

DESCRIPTION="Summarizes the contents of a syslog log file."
HOMEPAGE="http://github.com/globalcitizen/lxc-gentoo"
EGIT_REPO_URI="git://github.com/globalcitizen/lxc-gentoo.git"
#SRC_URI="http://github.com/globalcitizen/lxc-gentoo"o/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${RDEPEND}"

src_install() {
  dobin lxc-gentoo
}
