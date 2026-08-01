# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="VkFFT"

DESCRIPTION="Vulkan/CUDA/HIP/OpenCL/Level Zero/Metal Fast Fourier Transform library"
HOMEPAGE="https://github.com/DTolm/VkFFT"
SRC_URI="https://github.com/DTolm/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Header-only — consumers link against Vulkan/CUDA/HIP/OpenCL/Level Zero/Metal
# themselves depending on their chosen VKFFT_BACKEND.

src_install() {
	# vkFFT.h + vkFFT/ subheaders → /usr/include/vkFFT/
	insinto /usr/include/vkFFT
	doins -r vkFFT/.

	dodoc README.md
	if [[ -d documentation ]]; then
		docinto documentation
		dodoc -r documentation/.
	fi
}
