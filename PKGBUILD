# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprcursor"
pkgname="${_pkgname}-git"
pkgver=0.1.11.r3.g9c5dd1f7
pkgrel=1
pkgdesc="The hyprland cursor format, library and utilities"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/hyprcursor"
license=('BSD-3-Clause')
depends=('hyprlang-git' 'cairo' 'libzip' 'librsvg' 'tomlplusplus')
makedepends=('git' 'cmake' 'gcc')
source=("${_pkgname}::git+$url.git")
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}" "lib$_pkgname.so")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
     | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
	cmake --build ./build --config Release --target all
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

