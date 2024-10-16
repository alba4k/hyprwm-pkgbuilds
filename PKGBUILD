# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprsysteminfo"
pkgname="${_pkgname}-git"
pkgver=0.1.0.r0.g707a315c
pkgrel=1
pkgdesc="A tiny qt6/qml application to display information about the running system"
arch=(any)
url="https://github.com/hyprwm/hyprsysteminfo"
license=('BSD-3-Clause')
depends=('hyprutils-git>=0.2.3' 'qqc2-desktop-style')
makedepends=('git' 'cmake' 'gcc' 'gdb')
source=("${_pkgname}::git+https://github.com/hyprwm/hyprsysteminfo.git")
provides=("hyprsysteminfo")
conflicts=("hyprsysteminfo")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
    cmake --build ./build --config Release --target hyprsysteminfo
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
