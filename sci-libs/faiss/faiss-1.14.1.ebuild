# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg-utils git-r3

DESCRIPTION="A library for efficient similarity search and clustering of dense vectors."
HOMEPAGE="https://faiss.ai/"
EGIT_REPO_URI="https://github.com/facebookresearch/faiss.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="cuda"

DEPEND="
    virtual/blas
	cuda? ( dev-util/nvidia-cuda-toolkit )
	"


RDEPEND="${DEPEND}"

src_configure() {
MYCMAKEARGS="-DBUILD_TESTING=OFF -DFAISS_ENABLE_PYTHON=OFF"
if use cuda ; then
	MYCMAKEARGS+=" -DFAISS_ENABLE_GPU=ON -DCMAKE_CUDA_ARCHITECTURES=120"
else
	MYCMAKEARGS+=" -DFAISS_ENABLE_GPU=OFF"
fi

cmake_src_configure

}

pkg_postinst() {
    xdg_desktop_database_update
}
