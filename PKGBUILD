# Maintainer: Mohamed Abdifitaax <mahdiware@gmail.com>

pkgname=lid-monitor
pkgver=1.0
pkgrel=1
pkgdesc="A script to monitor laptop lid state and suspend the system when closed."
arch=('any')
license=('GPL3')
depends=('bash' 'systemd')
source=(
  "lid-monitor.sh"
  "config.json"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

package() {
    install -Dm755 "$srcdir/lid-monitor.sh" "$pkgdir/usr/bin/lid-monitor"
    install -Dm644 "$srcdir/config.json" "$pkgdir/etc/lid-monitor/config.json"
}

