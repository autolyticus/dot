#!/usr/bin/env bash
# $Id$
# Maintainer: Peter Strapp <peter at strapp.co.uk>

pkgname=python-pigpio-git
pkgver=r183.934874b
pkgrel=1
url="http://abyz.co.uk/rpi/pigpio/"
license=('custom:UNLICENSE')
arch=('any')
source=("git+https://github.com/joan2937/pigpio")
sha1sums=('SKIP')

_gitname='pigpio'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"
  sed -e '/ldconfig/d' -i Makefile
  sed -e 's|setup.py install|setup.py install --root="'"${pkgdir}"'/"|g' -i Makefile
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  mkdir -p "$pkgdir"/usr/lib/systemd/system
  install -m644 util/pigpiod.service "$pkgdir"/usr/lib/systemd/system/pigpiod.service
  make prefix=/usr DESTDIR="$pkgdir" install
}
