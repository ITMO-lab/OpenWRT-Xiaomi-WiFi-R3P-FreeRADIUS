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

opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/python3_*.ipk
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libpq_*.ipk
opkg --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/libopenldap_*.ipk


opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/freeradius3/freeradius3-mod-*.ipk


cd pkgs/base
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install $(ls -1)
cd ../..

freeradius3-common
freeradius3-democerts