# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="ONNX Runtime: cross-platform, high performance ML inferencing and training accelerator"
HOMEPAGE="https://developer.nvidia.com/cudnn"

SRC_URI="https://github.com/microsoft/onnxruntime/releases/download/v${PV}/${P}.tgz"


S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist test"

RDEPEND="
	dev-util/nvidia-cuda-toolkit
	dev-libs/cudnn
"

QA_PREBUILT="/lib/*"

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {

	cd ${S}/${P}

	dolib.so lib/*.so*

	mv include onnxruntime

	doheader -r onnxruntime


	insinto /usr/$(get_libdir)
	cd lib

	doins -r cmake
	doins -r pkgconfig
}