# 
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Minimal solvers for calibrated camera pose estimation"
HOMEPAGE="https://github.com/PoseLib/PoseLib"
SRC_URI="https://github.com/PoseLib/PoseLib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

# Source code has capitalisation
S="${WORKDIR}/PoseLib-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="${RDEPEND}"
RDEPEND="dev-cpp/eigen"


