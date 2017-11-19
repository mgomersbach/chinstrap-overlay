# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

#inherit eutils

DESCRIPTION="GTK3.20-compatible version of bitterologist's Numix Solarized"
HOMEPAGE="https://github.com/Ferdi265/numix-solarized-gtk-theme"
if [[ ${PV} == *9999* ]];then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/Ferdi265/numix-solarized-gtk-theme"
	KEYWORDS=""
else
	SRC_URI="https://github.com/Ferdi265/numix-solarized-gtk-theme/archive/v${PV}/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
	RESTRICT="mirror"
fi

LICENSE="LGPL-3"
SLOT="0"
IUSE="+green +blue +dark +light"

DEPEND="dev-ruby/sass:3.4 media-gfx/inkscape"
RDEPEND="x11-themes/gtk-engines-murrine"

src_prepare(){
    eapply_user
    if use green ; then
        if use dark; then
            cp -r ${S} ${S}DarkGreen
        fi
        if use light; then
            cp -r ${S} ${S}LightGreen
        fi
    fi
    if use blue ; then
        if use dark; then
            cp -r ${S} ${S}DarkBlue
        fi
        if use light; then
            cp -r ${S} ${S}LightBlue
        fi
    fi
}

src_compile(){
    if use green ; then
        if use dark; then
            cd "${S}DarkGreen"
            emake THEME=SolarizedDarkGreen gresource
        fi
        if use light; then
            cd "${S}LightGreen"
            emake THEME=SolarizedLightGreen gresource
        fi
    fi
    if use blue ; then
        if use dark; then
            cd "${S}DarkBlue"
            emake THEME=SolarizedDarkBlue gresource
        fi
        if use light; then
            cd "${S}LightBlue"
            emake THEME=SolarizedLightBlue gresource
        fi
    fi
}

src_install(){
    if use green ; then
        if use dark; then
            cd "${S}DarkGreen"
            emake install DESTDIR="${D}" THEME=SolarizedDarkGreen
        fi
        if use light; then
            cd "${S}LightGreen"
            emake install DESTDIR="${D}" THEME=SolarizedLightGreen
        fi
    fi
    if use blue ; then
        if use dark; then
            cd "${S}DarkBlue"
            emake install DESTDIR="${D}" THEME=SolarizedDarkBlue
        fi
        if use light; then
            cd "${S}LightBlue"
            emake install DESTDIR="${D}" THEME=SolarizedLightBlue
        fi
    fi
}
