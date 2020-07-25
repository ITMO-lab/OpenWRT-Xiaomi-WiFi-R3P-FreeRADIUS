echo "1. setup base packages"
ls -l pkgs/base
opkg --nodeps --force-reinstall --force-overwrite --force-downgrade install pkgs/base/htop_*.ipk
opkg --nodeps --force-reinstall --force-overwrite --force-downgrade install pkgs/base/nano_*.ipk
opkg --nodeps --force-reinstall --force-overwrite --force-downgrade install pkgs/base/git_*.ipk
opkg --nodeps --force-reinstall --force-overwrite --force-downgrade install pkgs/base/git-http_*.ipk
