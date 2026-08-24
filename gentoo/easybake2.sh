#!/bin/bash
# finds the ASCII art for gentoo txt
cat gentoo.txt
echo
echo
echo "Welcome to the Gentoo Installer script!"
echo
echo
# install packages for meta
sudo emerge -vkg kde-apps/kde-apps-meta

if ! equery list kde-apps/kde-apps-meta >/dev/null 2>&1; then
    echo "kde-apps/kde-apps-meta didn't install lol"
    exit 1
fi

echo "OK: kde-apps/kde-apps-meta is installed."

exit 0

