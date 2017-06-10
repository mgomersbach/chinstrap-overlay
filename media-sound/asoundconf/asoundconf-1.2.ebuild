# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 pypy )

inherit mercurial python-r1

DESCRIPTION="Allows you to select the default ALSA sound card"
HOMEPAGE="https://bitbucket.org/stativ/asoundconf"
EHG_REPO_URI="https://bitbucket.org/stativ/asoundconf"
LICENSE="GPL"

SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND="
	dev-python/pygtk
	"
