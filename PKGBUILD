# Maintainer: dawfukfr <dawfukfr@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname="aquamarine"
pkgname="${_pkgname}-git"
pkgver=0.4.0_r213.ga8eb8ae
pkgrel=1
pkgdesc='a very light linux rendering backend library'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(gcc-libs
         glibc
         hyprutils
         hyprwayland-scanner
         libdisplay-info
         libdrm
         libglvnd
         libinput
         mesa
         opengl-driver
         pixman
         pugixml
         seatd
         systemd-libs
         wayland
         wayland-protocols)
makedepends=(cmake)
provides=("lib$pkgname.so")
source=("${_pkgname}::git+https://github.com/hyprwm/aquamarine.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  _ver="$(cat VERSION)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	cmake -B build \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
