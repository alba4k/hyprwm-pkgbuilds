# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprpolkitagent"
pkgname="${_pkgname}-git"
pkgver=0.1.1.r4.g615efd49
pkgrel=1
pkgdesc="A polkit authentication agent written in QT/QML"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/hyprpolkitagent"
license=('BSD-3-Clause')
depends=('hyprutils-git' 'polkit-qt6' 'hyprland-qt-support-git')
makedepends=('git' 'cmake' 'gcc')
source=("${_pkgname}::git+https://github.com/hyprwm/hyprpolkitagent.git")
provides=("hyprpolkitagent")
conflicts=("hyprpolkitagent")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
    cmake --build ./build --config Release --target hyprpolkitagent
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
