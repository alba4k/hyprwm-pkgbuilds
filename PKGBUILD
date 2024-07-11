# Maintainer: dawfukfr <dawfukfr@gmail.com>

_pkgname="aquamarine"
pkgname="${_pkgname}-git"
pkgver=0.1.0_r104.g965f429
pkgrel=1
pkgdesc="Aquamarine is a very light linux rendering backend library "
arch=(any)
url="https://github.com/hyprwm/aquamarine"
license=('BSD-3-Clause')
depends=('pugixml')
makedepends=('git' 'cmake' 'gcc')
source=("${_pkgname}::git+https://github.com/hyprwm/aquamarine.git")
provides=("aquamarine")
conflicts=("aquamarine")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  _ver="$(grep -m1 'set(AQUAMARINE_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
  cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf _NPROCESSORS_CONF)
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
