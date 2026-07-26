# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="User space library and tools for the Coral Edge TPU"
HOMEPAGE="https://github.com/google-coral/libedgetpu"
EGIT_REPO_URI="https://github.com/mgomersbach/libedgetpu.git"
EGIT_BRANCH="combined-patches"

TF_VERSION="2.21.0"
LITERT_VERSION="2.1.3"
LITERT_URI="https://github.com/google-ai-edge/LiteRT"
SRC_URI="
	!litert? ( https://github.com/tensorflow/tensorflow/archive/v${TF_VERSION}.tar.gz -> tensorflow-${TF_VERSION}.tar.gz )
	litert? ( ${LITERT_URI}/archive/v${LITERT_VERSION}.tar.gz -> litert-${LITERT_VERSION}.tar.gz )
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="litert"

DEPEND="
	dev-cpp/abseil-cpp
	dev-libs/flatbuffers
	virtual/libusb:1
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

src_unpack() {
	git-r3_src_unpack
	default
}

_get_tfroot() {
	if use litert; then
		local litert_root
		litert_root=$(find "${WORKDIR}" -mindepth 1 -maxdepth 1 -type d -name 'LiteRT-*' | head -n1)
		[[ -n ${litert_root} ]] || die "Unable to find unpacked LiteRT sources"
		echo "${litert_root}"
	else
		echo "${WORKDIR}/tensorflow-${TF_VERSION}"
	fi
}

src_prepare() {
	default

	local tfroot=$(_get_tfroot)

	if use litert; then
		mkdir -p "${tfroot}/tensorflow" || die
		[[ -e "${tfroot}/tensorflow/lite" ]] || ln -s ../tflite "${tfroot}/tensorflow/lite" || die
	fi

	# Relax TensorFlow/LiteRT flatbuffers version pins in generated headers.
	while IFS= read -r -d '' f; do
		if grep -q '^[[:space:]]*static_assert(FLATBUFFERS_VERSION_MAJOR' "${f}"; then
			sed -i '/static_assert(FLATBUFFERS_VERSION_MAJOR/,/version included/ s|^|//|' \
				"${f}" || die
		fi
	done < <(find "${tfroot}" -type f -name '*_generated.h' -print0)

	# Some toolchains require explicit cstdint include in these headers.
	local hdr anchor
	while read -r hdr anchor; do
		grep -q '<cstdint>' "${hdr}" ||
			sed -i "s|${anchor}|${anchor}\n#include <cstdint>|" "${hdr}" || die
	done <<-EOF
		driver/usb/usb_device_interface.h #include "port/statusor.h"
		driver/usb/usb_ml_commands.h #include "driver/usb/usb_standard_commands.h"
		driver/usb/usb_standard_commands.h // Copyright 2019 Google LLC
		driver/usb/usb_io_request.h #include "driver/usb/usb_ml_commands.h"
		EOF

	# Ensure we don't force gold linker.
	sed -i 's|-fuse-ld=gold||g' makefile_build/Makefile || die

	# flatc wrapper: patch generated *_generated.h static_asserts to avoid version lock.
	cat > "${T}/flatc-wrapper.sh" <<-'EOF' || die
	#!/bin/bash
	set -euo pipefail
	/usr/bin/flatc "$@"
	out=""
	for ((i=1; i<=$#; i++)); do
	  if [[ "${!i}" == "-o" ]]; then
	    j=$((i+1))
	    out="${!j}"
	    break
	  fi
	done
	if [[ -n "${out}" && -d "${out}" ]]; then
	  while IFS= read -r -d '' f; do
	    sed -i '/static_assert(FLATBUFFERS_VERSION_MAJOR/,/Non-compatible flatbuffers version included/ s/^/\/\//' "$f"
	  done < <(find "${out}" -maxdepth 1 -name '*_generated.h' -print0)
	fi
	EOF
	chmod +x "${T}/flatc-wrapper.sh" || die
}

src_compile() {
	local tfroot=$(_get_tfroot)

	emake -f makefile_build/Makefile \
		TFROOT="${tfroot}" \
		BUILDDIR="${WORKDIR}/build" \
		PKG_CONFIG="$(tc-getPKG_CONFIG)" \
		CXX="$(tc-getCXX)" \
		CC="$(tc-getCC)" \
		FLATC="${T}/flatc-wrapper.sh"

	$(tc-getCC) ${CFLAGS} ${LDFLAGS} -Wall -o edgetpu-check tools/edgetpu-check.c -ldl || die
}

src_install() {
	# Install utility explicitly into /usr/bin.
	exeinto /usr/bin
	doexe edgetpu-check

	# Default (direct) runtime in the normal library path.
	dolib.so "${WORKDIR}/build/direct/k8/libedgetpu.so.1.0"
	dosym libedgetpu.so.1.0 /usr/$(get_libdir)/libedgetpu.so.1
	dosym libedgetpu.so.1 /usr/$(get_libdir)/libedgetpu.so

	# Throttled runtime under /opt/libedgetpu, with correct libdir layout.
	insinto /opt/libedgetpu/$(get_libdir)
	insopts -m0755
	doins "${WORKDIR}/build/throttled/k8/libedgetpu.so.1.0"
	insopts -m0644
	dosym libedgetpu.so.1.0 /opt/libedgetpu/$(get_libdir)/libedgetpu.so.1
	dosym libedgetpu.so.1 /opt/libedgetpu/$(get_libdir)/libedgetpu.so

	# Compatibility symlinks at /opt/libedgetpu root.
	dosym $(get_libdir)/libedgetpu.so.1.0 /opt/libedgetpu/libedgetpu.so.1.0
	dosym libedgetpu.so.1.0 /opt/libedgetpu/libedgetpu.so.1
	dosym libedgetpu.so.1 /opt/libedgetpu/libedgetpu.so

	insinto /usr/include/edgetpu
	doins -r tflite/public/*
}
