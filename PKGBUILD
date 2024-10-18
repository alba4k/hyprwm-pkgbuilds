# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprsunset"
pkgname="${_pkgname}-git"
pkgver=0.0.1.r8.f535c18
pkgrel=1
pkgdesc="An application to enable a blue-light filter on Hyprland"
arch=(any)
url="https://github.com/hyprwm/hyprsunset"
license=('BSD-3-Clause')
depends=('wayland' 'hyprutils-git>=0.2.3' 'wayland-protocols')
makedepends=('git' 'cmake' 'gcc' 'gdb' 'hyprland-protocols-git>=0.4.0' 'hyprwayland-scanner-git>=0.4.0')
source=("${_pkgname}::git+https://github.com/hyprwm/hyprsunset.git")
provides=("hyprsunset")
conflicts=("hyprsunset")
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
    cmake --build ./build --config Release --target hyprsunset
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
