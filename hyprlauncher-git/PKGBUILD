# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>

_pkgname="hyprlauncher"
pkgname="$_pkgname-git"
pkgver=0.1.0.r0.gd49288f
pkgrel=1
pkgdesc="multipurpose and versatile launcher / picker for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/hyprlauncher"
license=('BSD-3-Clause')

depends=(
  hyprlang-git
  hyprtoolkit-git
  hyprutils-git
  hyprwire-git
  icu
  libdrm
  libqalculate
  pixman
)
makedepends=(
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

