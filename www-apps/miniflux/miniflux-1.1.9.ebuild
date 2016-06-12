# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit depend.php webapp

DESCRIPTION="Miniflux is a minimalist RSS reader"
HOMEPAGE="https://miniflux.net"
SRC_URI="https://miniflux.net/${PN}-${PV}.zip"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE="sqlite"
REQUIRED_USE="|| ( sqlite )"

RDEPEND=">=dev-lang/php-5.3[pdo,xml,sqlite]"

need_php5

S=${WORKDIR}/${PN}

src_install() {
	webapp_src_preinst

	dodoc-php *.md  || die "dodoc failed"

	einfo "Installing web files"
	insinto "${MY_HTDOCSDIR}"
	doins -r * .htaccess_ovh || die "doins failed"

	einfo "Setting up container for configuration"
	insinto /etc/${PN}
	#doins Specific/.htaccess || die "doins failed"

	einfo "Fixing symlinks"
	dosym . "${MY_HTDOCSDIR}"/html

	webapp_src_install

	fowners -R nginx:nginx /etc/${PN}
}

pkg_postinst() {
	einfo "Ok"
#	einfo "In order to setup miniflux:"
#	einfo "- create /etc/${PN}/ENABLE_INSTALL owner nginx:nginx"
#	einfo "- point your browser at the instal's URL and follow the setup"
}
