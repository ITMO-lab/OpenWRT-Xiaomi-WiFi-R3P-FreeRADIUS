echo "========= 1. setup base packages ========="
ls -l pkgs/base
opkg remove htop nano git git-http
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/htop_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/nano_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/git_*.ipk
opkg --nodeps --force-maintainer --force-depends --force-reinstall --force-overwrite --force-downgrade install pkgs/base/git-http_*.ipk
echo
echo "========= 2. setup freeradius3 packages ========="


