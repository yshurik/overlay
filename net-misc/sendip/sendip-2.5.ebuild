# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit flag-o-matic eutils

DESCRIPTION="SendIP is a commandline tool to allow sending arbitrary IP packets. "
HOMEPAGE="http://www.earth.li/projectpurple/progs/sendip.html"
SRC_URI="http://www.earth.li/projectpurple/files/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	cd "${S}"
	epatch ${FILESDIR}/ipv4.patch
	epatch ${FILESDIR}/tcp.patch
	epatch ${FILESDIR}/make.patch
	epatch ${FILESDIR}/make2.patch
}

