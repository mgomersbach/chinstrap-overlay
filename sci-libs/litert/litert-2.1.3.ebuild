# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Meta package for running Edge TPU models via LiteRT + libedgetpu"
HOMEPAGE="https://github.com/google-ai-edge/LiteRT https://github.com/google-coral/libedgetpu"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

RDEPEND="
	sci-libs/libedgetpu
	dev-python/ai-edge-litert
"

DOCS=( "${FILESDIR}/README.litert-stack.md" )

src_install() {
	einstalldocs
}

pkg_postinst() {
	elog "Model loading stack is now available:"
	elog "  - libedgetpu runtime: sci-libs/libedgetpu"
	elog "  - LiteRT interpreter: dev-python/ai-edge-litert"
	elog ""
	elog "Python example:"
	elog "  from ai_edge_litert.interpreter import Interpreter, load_delegate"
	elog "  d = load_delegate('libedgetpu.so.1', {'device': 'pci:0'})"
	elog "  i = Interpreter(model_path='model_edgetpu.tflite', experimental_delegates=[d])"
}
