# Maintainer: zjeffer
# Co-Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname=hyprlang
pkgname="${_pkgname}-git"
pkgver=0.5.2.r8.gadbefbf4
pkgrel=1
pkgdesc="The official implementation library for the hypr config language"
arch=(any)
url="https://github.com/hyprwm/hyprlang"
license=('GPL')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cmake' 'hyprutils-git' 'pixman')
source=("$_pkgname::git+$url.git")
conflicts=("$_pkgname")
provides=("$_pkgname=${pkgver%%.r*}" "lib$_pkgname.so")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
     | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
	cmake --build ./build --config Release --target hyprlang
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="$pkgdir" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
