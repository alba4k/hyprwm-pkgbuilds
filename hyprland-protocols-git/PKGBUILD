# Maintainer: TheK0tYaRa
# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>
# Inspired by: FabioLolix, éclairevoyant, ThatOneCalculator <kainoa at t1c dot dev>

_pkgname="hyprland-protocols"
pkgname="$_pkgname-git"
pkgver=0.7.0.r4.g1cb6db5
pkgrel=1
pkgdesc="Wayland protocol extensions for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/hyprland-protocols"
license=('BSD-3-Clause')

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
  local _tag=$(git tag -l --contains $(git describe --tags --abbrev=0) --sort=-v:refname | head -n1 | sed 's/^v//')
  printf "%s.r%s.g%s" "$_tag" $(git rev-list --count --cherry-pick "v${_tag}...HEAD") $(git rev-parse --short=7 HEAD)
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

