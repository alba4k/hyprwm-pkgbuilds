# Maintainer: FabioLolix
# Maintainer: éclairevoyant
# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
# Contributor: ThatOneCalculator <kainoa at t1c dot dev>

pkgname=hyprland-git
pkgver=0.45.0.r120.e340e9f4
pkgrel=1
pkgdesc="Hyprland is an independent, highly customizable, dynamic tiling Wayland compositor that doesn't sacrifice on its looks"
arch=(any)
url="https://github.com/hyprwm/Hyprland"
license=(BSD-3-Clause)
depends=(
  aquamarine-git
  cairo
  gcc-libs
  glib2
  glibc
  glslang
  hyprcursor-git
  hyprgraphics-git
  hyprland-qtutils-git
  hyprlang-git
  hyprutils-git
  libdisplay-info
  libdrm
  libglvnd
  libinput
  libliftoff
  libx11
  libxcb
  libxcomposite
  libxcursor
  libxfixes
  libxkbcommon
  libxrender
  mesa
  opengl-driver
  pango
  pixman
  polkit
  re2
  seatd
  systemd-libs
  tomlplusplus
  wayland
  wayland-protocols
  xcb-proto
  xcb-util
  xcb-util-errors
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  xcb-util-wm
  xorg-xwayland
)
makedepends=(
  cmake
  git
  hyprwayland-scanner-git
  hyprland-protocols-git
  jq
  make
  meson
  ninja
  patch
  pkgconf
  xorgproto
)
optdepends=(
  'cmake: to build and install plugins using hyprpm'
  'cpio: to build and install plugins using hyprpm'
  'meson: to build and install plugins using hyprpm'
  'uwsm: the recommended way to start Hyprland'
)
provides=("hyprland=${pkgver%%.r*}")
conflicts=(hyprland)
source=(
  "git+https://github.com/hyprwm/Hyprland.git"
  "git+https://github.com/canihavesomecoffee/udis86.git"
)
b2sums=(
  'SKIP'
  'SKIP'
)

pick_mr() {
  git pull origin pull/$1/head --no-edit
}

prepare() {
  cd Hyprland
  git submodule init
  git config submodule.subprojects/udis86.url "$srcdir/udis86"
  git config submodule.subprojects/tracy.update none
  git -c protocol.file.allow=always submodule update

  if [[ -z "$(git config --get user.name)" ]]; then
    git config user.name local && git config user.email '<>' && git config commit.gpgsign false
  fi
  # Pick pull requests from github using `pick_mr <pull request number>`.
  # e.g. `pick_mr 1000`
}

pkgver() {
  git -C Hyprland describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd Hyprland

  cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
  cmake --build ./build --config Release --target all
}

package() {
  cd Hyprland

  DESTDIR="${pkgdir}" cmake --install build

  # license
  install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
# vi: et ts=2 sw=2

