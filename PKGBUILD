# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hypridle"
pkgname="${_pkgname}-git"
pkgver=0.1.0.r13.gb9c94ed8
pkgrel=1
pkgdesc="Hyprland's idle daemon"
arch=(any)
url="https://github.com/hyprwm/hypridle"
license=('BSD')
depends=('wayland' 'hyprlang>=0.4.0' 'sdbus-cpp')
makedepends=('git' 'cmake' 'ninja' 'gcc' 'gdb' 'meson' 'wayland-protocols' 'xorgproto')
source=("${_pkgname}::git+https://github.com/hyprwm/hypridle.git")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}


build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
    cmake --build ./build --config Release --target hypridle
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 build/hypridle -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
