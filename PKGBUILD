# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprland-welcome"
pkgname="${_pkgname}-git"
pkgver=0.0.1.r19.51561c0
pkgrel=1
pkgdesc=" Hyprland's welcome app, written in qt"
arch=(any)
url="https://github.com/hyprwm/hyprland-welcome"
license=('BSD-3-Clause')
depends=('qt6-base' 'qt6-wayland')
makedepends=('git' 'cmake' 'gcc' 'gdb')
source=("${_pkgname}::git+https://github.com/hyprwm/hyprland-welcome.git")
provides=("hyprland-welcome")
conflicts=("hyprland-welcome")
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
    cmake --build ./build --config Release --target HyprlandWelcome
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
