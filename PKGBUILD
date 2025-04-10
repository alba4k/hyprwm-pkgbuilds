# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprsysteminfo"
_pkgsrc=$_pkgname
pkgname="$_pkgname-git"
pkgver=0.1.3.r2.g6769e50
pkgrel=1
pkgdesc="A tiny qt6/qml application to display information about the running system"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/$_pkgname"
license=('BSD-3-Clause')
depends=(
  'hyprland-qt-support-git'
  'hyprutils-git>=0.2.3'
)
makedepends=(
  cmake
  git
  ninja
)
source=("$_pkgsrc::git+$url.git")
conflicts=("$_pkgname")
provides=("$_pkgname=${pkgver%%.r*}")
sha256sums=('SKIP')

: '
prepare() {
	# Pick pull request form GitHub replacing NUM with the pr number
	# e.g. git pull origin pull/111/head --no-edit --rebase

	git pull origin pull/NUM/head --no-edit --rebase
}
'

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
