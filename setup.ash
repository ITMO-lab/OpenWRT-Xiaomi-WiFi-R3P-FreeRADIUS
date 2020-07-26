echo "========= 1. setup base packages ========="
ls -l pkgs/base
opkg remove htop nano git git-http
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/htop_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/nano_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/git_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/git-http_*.ipk
echo
echo "========= 2. setup freeradius3 packages ========="
ls -l pkgs/freeradius3
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libtalloc_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libpcap1_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libpcre_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/freeradius3-common_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/freeradius3_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/freeradius3-utils_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/freeradius3-democerts_*.ipk

opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3_*.ipk

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

opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libpq_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libsasl2_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libopenldap_*.ipk

opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/freeradius3-mod-*.ipk


cd pkgs/base
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install $(ls -1)
cd ../..

freeradius3-common
freeradius3-democerts