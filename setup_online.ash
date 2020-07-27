echo
echo "========= 0. update packages list ========="
opkg update # For removing locks
opkg update
echo "========= 1. install base packages ========="
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install htop
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install nano
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install git
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install git-http
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install tmux
echo
echo "========= 2. install freeradius3 dependencies ========="
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install libtalloc
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install libpcap1
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install libpcre
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install freeradius3-common
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install freeradius3
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install freeradius3-utils
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install freeradius3-democerts
echo
echo "========= 3. install python3 ========="
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-pip
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-setuptools
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python-pip-conf
echo
echo "========= 4. install python3 dependencies ========="
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-base
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-light
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-unittest
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-ncurses
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-ctypes
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-pydoc
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-logging
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-multiprocessing
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-email
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-urllib
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-urllib3
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-gdbm
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-sqlite3
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-xml
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-codecs
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-distutils
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-openssl
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-cgi
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-cgitb
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-dbm
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-asyncio
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install liblzma
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-lzma
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install python3-decimal
echo
echo "========= 5. install freeradius3 dependencies part 2 ========="
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install libpq
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install libsasl2
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install libopenldap
echo
echo "========= 6. install freeradius3 modifications ========="
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install freeradius3*
echo
echo "========= 7. upgrade openssl and wpad ========="
opkg --force-removal-of-dependent-packages remove wpad-mini
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install wpad
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install gnutls-utils*
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install kmod-crypto-authenc*
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install kmod-cryptodev*
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install libgnutls*
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install libopenssl*
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install libustream-openssl*
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install libustream-openssl*
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install luci-ssl-openssl*
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install openssl-util*
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install wpad-openssl*
echo
echo "========= 8. configuring freeradius3 ========="
service radiusd stop
cp pkgs/freeradius3_setup/clients.conf /etc/freeradius3/clients.conf
FREERADIUS3_SECRET=$(< /dev/urandom tr -dc A-Za-z0-9 | head -c${1:-64})
echo "# 192.168.1.1" >> /etc/freeradius3/clients.conf
echo "client 192.168.1.1 {" >> /etc/freeradius3/clients.conf
echo "        secret = $FREERADIUS3_SECRET" >> /etc/freeradius3/clients.conf
echo "        ipaddr = 192.168.1.1" >> /etc/freeradius3/clients.conf
echo "}" >> /etc/freeradius3/clients.conf
echo "" >> /etc/freeradius3/clients.conf
echo "freeradius3 server configurated"
echo "=============================================="
echo "============ FREERADIUS3 SECRET is ==========="
echo "=============================================="
echo
echo $FREERADIUS3_SECRET
echo
echo "=============================================="
echo
cp pkgs/freeradius3_setup/authorize /etc/freeradius3/mods-config/files/authorize
FREERADIUS3_ROOT_PASSWORD=$(< /dev/urandom tr -dc A-Za-z0-9 | head -c${1:-64})
echo "root    Cleartext-Password := \"$FREERADIUS3_ROOT_PASSWORD\"" >> /etc/freeradius3/mods-config/files/authorize
echo "" >> /etc/freeradius3/mods-config/files/authorize
echo
echo "freeradius3 root account created"
echo "=============================================="
echo "======== FREERADIUS3 ROOT PASSWORD is ========"
echo "=============================================="
echo
echo $FREERADIUS3_ROOT_PASSWORD
echo
echo "=============================================="
echo "You can change it in /etc/freeradius3/mods-config/files/authorize"
echo "=============================================="
echo
echo "for all windows 10 users - you should enable tls 1.2+"
echo "https://support.microsoft.com/ru-ru/help/3121002/windows-10-devices-can-t-connect-to-an-802-1x-environment"
echo
echo "=============================================="
