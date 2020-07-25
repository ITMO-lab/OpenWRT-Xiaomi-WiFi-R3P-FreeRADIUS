echo "1. setup base packages"
ls -l pkgs/base
opkg --nodeps --force-reinstall --force-overwrite --force-downgrade install pkgs/base *.ipk
