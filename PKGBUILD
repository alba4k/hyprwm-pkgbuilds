# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprwayland-scanner"
pkgname="${_pkgname}-git"
pkgver=0.0.1.r17.eb11420
pkgrel=1
pkgdesc="A Hyprland implementation of wayland-scanner, in and for C++. "
arch=(any)
url="https://github.com/hyprwm/hypridle"
license=('BSD')
depends=('wayland' 'pugixml')
makedepends=('git' 'cmake' 'gcc' 'gdb' 'systemd' 'wayland-protocols' 'xorgproto')
source=("${_pkgname}::git+https://github.com/hyprwm/hyprwayland-scanner.git")
provides=("hyprwayland-scanner")
conflicts=("hhyprwayland-scanner")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    #git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
    #  | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
	printf "0.0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
