# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprsunset"
pkgname="${_pkgname}-git"
pkgver=0.2.0.r0.g7b7339f
pkgrel=1
pkgdesc="An application to enable a blue-light filter on Hyprland"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/hyprsunset"
license=('BSD-3-Clause')
depends=('wayland' 'hyprutils-git>=0.2.3' 'wayland-protocols')
makedepends=('git' 'cmake' 'gcc' 'hyprland-protocols-git>=0.4.0' 'hyprwayland-scanner-git>=0.4.0')
source=("${_pkgname}::git+https://github.com/hyprwm/hyprsunset.git")
provides=("hyprsunset")
conflicts=("hyprsunset")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
    cmake --build ./build --config Release --target hyprsunset
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprsunset"
_pkgsrc=$_pkgname
pkgname="$_pkgname-git"
pkgver=0.2.0.r0.g7b7339f
pkgrel=1
pkgdesc="An application to enable a blue-light filter on Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/$_pkgname"
license=('BSD-3-Clause')
depends=(
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
