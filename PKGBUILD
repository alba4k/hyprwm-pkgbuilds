# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>

_pkgname="hyprland-welcome"
pkgname="$_pkgname-git"
pkgver=r19.51561c0
pkgrel=1
pkgdesc="Hyprland's welcome app, written in qt"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/hyprland-welcome"
license=('BSD-3-Clause')

depends=(
  qt6-base
  qt6-wayland
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
  ( set -o pipefail                       # CHANGE THIS ONCE A TAGGED RELEASE COMES OUT
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
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
