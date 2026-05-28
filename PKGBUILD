# Maintainer: Rellot
# This is my personal eww build for my dotfiles
# this will replace/update your current eww!

_pkgname=CustomEww
pkgname="eww-git"
pkgver=0.7.0
pkgrel=1
pkgdesc="ElKowar's wacky widgets by rellot"
arch=(x86_64)
url="https://github.com/Rellotscrewdriver/$_pkgname"
license=(MIT)
depends=(gtk3 gtk-layer-shell libdbusmenu-glib libdbusmenu-gtk3)
makedepends=(cargo git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

prepare() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd $_pkgname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -d "$pkgdir/etc/xdg/$_pkgname/"
	cp -r examples/eww-bar "$pkgdir/etc/xdg/$_pkgname/"
	install -Dm755 target/release/$_pkgname -t "$pkgdir/usr/bin/"
}
