# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE="http://oilshell.org/"

MY_PV="${PV/_pre/.pre}"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${PN}shell/${PN}.git"
else
	SRC_URI="https://www.oilshell.org/download/${PN}-${MY_PV}.tar.xz"
	KEYWORDS="amd64"
fi

LICENSE="Apache-2.0"
SLOT="0"

IUSE="readline"

RDEPEND="readline? ( sys-libs/readline )"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${MY_PV}"

#src_prepare() {
#}

src_configure() {
	econf \
		$(use_with readline)
}
