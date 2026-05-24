# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>

_pkgname="hyprpwcenter"
pkgname="$_pkgname-git"
pkgver=0.1.2.r10.gfd4fd52
pkgrel=1
pkgdesc="A GUI Pipewire control center"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/hyprpwcenter"
license=('BSD-3-Clause')

depends=(
  hyprtoolkit-git
  hyprutils-git
  libdrm
  libpipewire
  pixman
)
makedepends=(
  cmake
  git
  ninja
)
optdepends=(
    'ttf-material-symbols-variable-git: Recommended font for icons'
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
