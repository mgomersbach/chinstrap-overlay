# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/geany-plugins/geany-plugins-1.24-r1.ebuild,v 1.2 2015/04/08 17:54:03 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1 vala versionator git-2 autotools eutils

DESCRIPTION="A collection of different plugins for Geany"
HOMEPAGE="http://plugins.geany.org/geany-plugins"
SRC_URI=""
EGIT_REPO_URI="git://github.com/geany/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="+autoclose +commander debugger +defineformat devhelp enchant gitchangebar gpg gtkspell markdown multiterm nls python scope soup webkit"

COMMON_DEPEND=">=dev-util/geany-$(get_version_component_range 1-2)
	autoclose? ( x11-libs/gtk+:2 )
	commander? ( x11-libs/gtk+:2 )
	defineformat? ( x11-libs/gtk+:2 )
	dev-libs/libxml2:2
	dev-libs/glib:2
	debugger? ( x11-libs/vte:0 )
	devhelp? (
		dev-util/devhelp
		gnome-base/gconf:2
		net-libs/webkit-gtk:2
		x11-libs/gtk+:2
		x11-libs/libwnck:1
		)
	enchant? ( app-text/enchant )
  gitchangebar? ( dev-libs/libgit2 )
	gpg? ( app-crypt/gpgme )
	gtkspell? ( app-text/gtkspell:2 )
	markdown? (
		app-text/discount
		net-libs/webkit-gtk:2
		x11-libs/gtk+:2
		)
	multiterm? (
		$(vala_depend)
		x11-libs/gtk+:2
		>=x11-libs/vte-0.28:0
		)
	python? (
		dev-python/pygtk[${PYTHON_USEDEP}]
		${PYTHON_DEPS}
		)
	scope? ( x11-libs/vte:0 )
	soup? ( net-libs/libsoup )
	webkit? (
		net-libs/webkit-gtk:2
		x11-libs/gtk+:2
		x11-libs/gdk-pixbuf:2
		)"
RDEPEND="${COMMON_DEPEND}
	scope? ( sys-devel/gdb )"
DEPEND="${COMMON_DEPEND}
	nls? ( sys-devel/gettext )
	virtual/pkgconfig"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	# bundled lib buster
	rm markdown/peg-markdown/markdown_lib.c || die

  # LINGUAS hack
  pushd po &>/dev/null
  for l in $LINGUAS; do
    test -f ${l}.po || LINGUAS=${LINGUAS/$l/}
  done
  popd &>/dev/null

	#autotools-utils_src_prepare
  #python_foreach_impl preparation
  mkdir -p build/cache
  intltoolize --force --copy --automake || die "intltoolize failed"
  eautoreconf || die "eautoreconf failed"
  rm po/Makefile.in.in
	use multiterm && vala_src_prepare
}

src_configure() {
  eautoreconf
	econf \
		--docdir=/usr/share/doc/${PF} \
		--disable-cppcheck \
		--disable-extra-c-warnings \
		--disable-geanygendoc \
		--disable-geanylua \
		--disable-geanyprj \
		--disable-overview \
		--disable-peg-markdown \
		--disable-projectorganizer \
		--enable-geanymacro \
		--enable-geanynumberedbookmarks \
		--enable-pretty-printer \
		--enable-tableconvert \
		--enable-treebrowser \
		--enable-xmlsnippets \
		$(use_enable autoclose) \
		$(use_enable commander) \
		$(use_enable debugger) \
		$(use_enable defineformat) \
		$(use_enable devhelp)
		$(use_enable enchant spellcheck) \
		$(use_enable gitchangebar) \
		$(use_enable gpg geanypg) \
		$(use_enable gtkspell) \
		$(use_enable markdown) \
		$(use_enable multiterm) \
		$(use_enable nls) \
		$(use_enable python geanypy) \
		$(use_enable scope) \
		$(use_enable soup updatechecker) \
		$(use_enable soup geniuspaste) \
		$(use_enable webkit webhelper)
}

