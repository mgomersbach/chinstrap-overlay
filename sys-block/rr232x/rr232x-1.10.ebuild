# Copyright 1999-2012 Gentoo Foundation 
# Distributed under the terms of the GNU General Public License v2 
# $Header: $ 

inherit linux-mod eutils

MY_PR="091022" 
MY_PVR="${PV}-${MY_PR}" 

DESCRIPTION="Kernel module for Highpoint RocketRaid 232x raid cards" 
HOMEPAGE="http://www.highpoint-tech.com/USA/rr2320.htm" 
SRC_URI="http://www.highpoint-tech.com/BIOS_Driver/rr232x/Linux/new%20format/rr232x-linux-src-v${PV}-090716-0928.tar.gz" 

LICENSE="GPL" 
SLOT="0" 
KEYWORDS="x86 amd64" 
IUSE="" 

DEPEND="" 
RDEPEND="" 

S="${WORKDIR}/${PN}-linux-src-v${PV}" 

BUILD_PARAMS="KERNELDIR=${KERNEL_DIR}" 
BUILD_TARGETS=" " 
MODULE_NAMES="rr232x(kernel/drivers/scsi/rr232x:${S}/product/rr232x/linux/:)" 

src_unpack() { 
        unpack ${A} 
	cd "${S}"
	epatch "${FILESDIR}"/rrkernel.patch
        cd "${S}/lib/linux"
}
