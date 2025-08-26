# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>

_pkgname="hyprsunset"
pkgname="$_pkgname-git"
pkgver=0.3.1.r0.g962f519
pkgrel=1
pkgdesc="An application to enable a blue-light filter on Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/hyprsunset"
license=('BSD-3-Clause')
depends=(
  hyprlang-git
  'hyprutils-git>=0.2.3'
  wayland
  wayland-protocols
)
makedepends=(
  'hyprland-protocols-git>=0.4.0'
  'hyprwayland-scanner-git>=0.4.0'
  cmake
  git
  ninja
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc=$_pkgname
source=("$_pkgsrc::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
