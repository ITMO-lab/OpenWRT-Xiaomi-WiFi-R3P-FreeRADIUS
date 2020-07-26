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
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3_*.ipk
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
echo "========= 7. configuring freeradius3 ========="
cp pkgs/freeradius3_setup/clients.conf /etc/freeradius3/clients.conf
FREERADIUS3_SECRET="testing123321"
echo "# localhost" >> /etc/freeradius3/clients.conf
echo "client localhost {" >> /etc/freeradius3/clients.conf
echo "        secret = $FREERADIUS3_SECRET" >> /etc/freeradius3/clients.conf
echo "}" >> /etc/freeradius3/clients.conf
echo "" >> /etc/freeradius3/clients.conf
echo
echo "=============================================="
echo "============ FREERADIUS3 SECRET is ==========="
echo $FREERADIUS3_SECRET
echo "=============================================="
echo


service radiusd stop
radiusd -X
echo "User-Name=bob,User-Password=hello" | radclient localhost:1812 auth testing123




