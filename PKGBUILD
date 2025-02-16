# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprgraphics"
pkgname="${_pkgname}-git"
pkgver=0.1.0.r0.g4d927a52
pkgrel=1
pkgdesc="Hyprland graphics / resource utilities"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/hyprgraphics"
license=('BSD-3-Clause')
depends=('pixman' 'cairo' 'hyprutils-git' 'libjpeg' 'libspng' 'libwebp' 'libjxl' 'file')
makedepends=('git' 'cmake' 'gcc')
source=("${_pkgname}::git+https://github.com/hyprwm/hyprgraphics.git")
provides=("${_pkgname}=${pkgver%%.r*}" "lib$_pkgname.so")
conflicts=("hyprgraphics")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
    cmake --build ./build --config Release --target hyprgraphics
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
