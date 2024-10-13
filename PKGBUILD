# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprutils"
pkgname="${_pkgname}-git"
pkgver=0.2.3.r2.g3f529343
pkgrel=1
pkgdesc="Hyprland utilities library used across the ecosystem"
arch=(any)
url="https://github.com/hyprwm/hyprutils"
license=('BSD-3-Clause')
depends=('pixman')
makedepends=('git' 'cmake' 'gcc' 'make')
source=("${_pkgname}::git+https://github.com/hyprwm/hyprutils.git")
provides=("${_pkgname}=${pkgver%%.r*}" "lib$_pkgname.so")
conflicts=("hyprutils")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
	cmake --build ./build --config Release --target all
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

