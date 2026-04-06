# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Metapackage for a suite of sparse matrix tools"
HOMEPAGE="https://people.engr.tamu.edu/davis/suitesparse.html"

LICENSE="metapackage"
SLOT="0"

KEYWORDS="~amd64"
IUSE="cuda doc lapack partition tbb"
DEPEND=""
RDEPEND="
	~sci-libs/suitesparseconfig-${PV}
	~sci-libs/amd-3.3.4
	~sci-libs/btf-2.3.3
	~sci-libs/camd-3.3.5
	~sci-libs/ccolamd-3.3.5
	~sci-libs/cholmod-5.3.4
	~sci-libs/colamd-3.3.5
	~sci-libs/cxsparse-4.4.2
	~sci-libs/klu-2.3.6
	~sci-libs/ldl-3.3.3
	~sci-libs/spqr-4.3.6
	~sci-libs/umfpack-6.3.7"
