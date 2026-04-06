# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib toolchain-funcs

Sparse_PV=$(ver_rs 3 '.')
Sparse_P="SuiteSparse-${Sparse_PV}"
DESCRIPTION="Common configurations for all packages in suitesparse"
HOMEPAGE="https://people.engr.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/refs/tags/v${Sparse_PV}.tar.gz -> ${Sparse_P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0/7"
KEYWORDS="~amd64"
IUSE="openmp cuda"

# BLAS availability is checked for at configuration time and will fail if it is not present.
BDEPEND="virtual/blas"

S="${WORKDIR}/${Sparse_P}/SuiteSparse_config"

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

multilib_src_configure() {
	# Using the defaults where appropriate only provide switches where appropriate
	# Force use of system dependencies
	local mycmakeargs=(
		-DSUITESPARSE__CONFIG_USE_OPENMP=$(usex openmp ON OFF)
		-DSUITESPARSE_USE_CUDA=$(usex cuda ON OFF)
		-DSUITESPARSE_ENABLE_PROJECTS=suitesparse_config
		-DSUITESPARSE_USE_SYSTEM_AMD=ON
		-DSUITESPARSE_USE_SYSTEM_BTF=ON
		-DSUITESPARSE_USE_SYSTEM_CAMD=ON
		-DSUITESPARSE_USE_SYSTEM_CCOLAMD=ON
		-DSUITESPARSE_USE_SYSTEM_CHOLMOD=ON
		-DSUITESPARSE_USE_SYSTEM_COLAMD=ON
		-DSUITESPARSE_USE_SYSTEM_GRAPHBLAS=ON
	)
	cmake_src_configure
}
