# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprwayland-scanner"
pkgname="${_pkgname}-git"
pkgver=0.1.0.r1.geb11420c
pkgrel=1
pkgdesc="A Hyprland implementation of wayland-scanner, in and for C++. "
arch=(any)
url="https://github.com/hyprwm/hypridle"
license=('BSD')
depends=('pugixml')
makedepends=('git' 'cmake' 'gcc')
source=("${_pkgname}::git+https://github.com/hyprwm/hyprwayland-scanner.git")
provides=("hyprwayland-scanner")
conflicts=("hhyprwayland-scanner")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
    cmake --build ./build --config Release
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
