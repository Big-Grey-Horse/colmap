# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A general-purpose Structure-from-Motion and Multi-View Stereo pipeline."
HOMEPAGE="https://colmap.github.io/"
SRC_URI="https://github.com/colmap/glomap/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"


LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-db/sqlite
	dev-cpp/eigen
	dev-libs/boost
	dev-qt/qtbase
	dev-qt/qtopengl
	media-libs/freeimage
	media-libs/glew
	media-libs/openimageio
	sci-libs/ceres-solver[sparse]
	sci-libs/cholmod
	sci-libs/flann
	sci-libs/metis
	sci-libs/onnxruntime-linux-x64-gpu
	sci-libs/poselib
	sci-mathematics/cgal
"

RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

PATCHES=(
        "${FILESDIR}/${PN}-1.2.0-do not fetch dependencies.patch"
)

#PATCHES=(
#	"${FILESDIR}/${PN}-4.0.2-do not fetch dependencies.patch"
#)

MYCMAKEARGS="-DCMAKE_CUDA_ARCHITECTURES=120"

