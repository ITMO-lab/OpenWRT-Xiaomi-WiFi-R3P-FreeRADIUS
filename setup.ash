echo
echo "========= 1. install base packages ========="
opkg remove htop nano git-http tmux
opkg remove git
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/htop_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/nano_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/git_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/git-http_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/tmux_*.ipk
echo
echo "========= 2. install freeradius3 dependencies ========="
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libtalloc_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libpcap1_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libpcre_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/freeradius3-common_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/freeradius3_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/freeradius3-utils_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/freeradius3-democerts_*.ipk
echo
echo "========= 3. install python3 ========="
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3_*.ipk
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-pip_*.ipk
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-setuptools_*.ipk
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python-pip-conf_*.ipk
python3-pkg-resources
echo
echo "========= 4. install python3 dependencies ========="
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-base_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-light_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-unittest_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-ncurses_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-ctypes_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-pydoc_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-logging_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-multiprocessing_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-email_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-urllib_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-urllib3_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-gdbm_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-sqlite3_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-xml_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-codecs_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-distutils_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-openssl_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-cgi_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-cgitb_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-dbm_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-asyncio_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/liblzma_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-lzma_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3-decimal_*.ipk
echo
echo "========= 5. install freeradius3 dependencies part 2 ========="
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libpq_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libsasl2_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libopenldap_*.ipk
echo
echo "========= 6. install freeradius3 modifications ========="
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/freeradius3-mod-*.ipk
echo
echo "========= 7. upgrade openssl and wpad ========="
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/openssl/*.ipk
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
echo
echo "config wifi-device 'radio0'" > /etc/config/wireless
echo "        option type 'mac80211'" >> /etc/config/wireless
echo "        option channel '1'" >> /etc/config/wireless
echo "        option hwmode '11g'" >> /etc/config/wireless
echo "        option path 'pci0000:00/0000:00:00.0/0000:01:00.0'" >> /etc/config/wireless
echo "        option htmode 'HT40'" >> /etc/config/wireless
echo "        option country 'RU'" >> /etc/config/wireless
echo "        option noscan '1'" >> /etc/config/wireless
echo "        option txpower '20'" >> /etc/config/wireless
echo "" >> /etc/config/wireless
echo "config wifi-iface 'default_radio0'" >> /etc/config/wireless
echo "        option device 'radio0'" >> /etc/config/wireless
echo "        option network 'lan'" >> /etc/config/wireless
echo "        option mode 'ap'" >> /etc/config/wireless
echo "        option ssid '$(uname -n)'" >> /etc/config/wireless
echo "        option encryption 'wpa2+ccmp'" >> /etc/config/wireless
echo "        option auth_server '192.168.1.1'" >> /etc/config/wireless
echo "        option auth_secret '$FREERADIUS3_SECRET'" >> /etc/config/wireless
echo "        option wpa_disable_eapol_key_retries '1'" >> /etc/config/wireless
echo "        option disassoc_low_ack '0'" >> /etc/config/wireless
echo "" >> /etc/config/wireless
echo "config wifi-device 'radio1'" >> /etc/config/wireless
echo "        option type 'mac80211'" >> /etc/config/wireless
echo "        option channel '36'" >> /etc/config/wireless
echo "        option hwmode '11a'" >> /etc/config/wireless
echo "        option path 'pci0000:00/0000:00:01.0/0000:02:00.0'" >> /etc/config/wireless
echo "        option country 'RU'" >> /etc/config/wireless
echo "        option disabled '0'" >> /etc/config/wireless
echo "        option txpower '23'" >> /etc/config/wireless
echo "        option htmode 'VHT80'" >> /etc/config/wireless
echo "" >> /etc/config/wireless
echo "config wifi-iface 'default_radio1'" >> /etc/config/wireless
echo "        option device 'radio1'" >> /etc/config/wireless
echo "        option network 'lan'" >> /etc/config/wireless
echo "        option mode 'ap'" >> /etc/config/wireless
echo "        option ssid '$(uname -n)-5G'" >> /etc/config/wireless
echo "        option encryption 'wpa2+ccmp'" >> /etc/config/wireless
echo "        option auth_server '192.168.1.1'" >> /etc/config/wireless
echo "        option auth_secret '$FREERADIUS3_SECRET'" >> /etc/config/wireless
echo "        option wpa_disable_eapol_key_retries '1'" >> /etc/config/wireless
echo "        option disassoc_low_ack '0'" >> /etc/config/wireless
echo "" >> /etc/config/wireless
