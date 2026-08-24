cat gentoo.txt
echo "Welcome to gentoo KDE script"
echo
echo "Launching"
echo
sudo emerge -vkg kde-plasma/kdeplasma-addons
echo
sudo emerge -vkg kde-plasma/kdeplasma-addons

if ! equery list kde-plasma/kdeplasma-addons >/dev/null 2>&1; then
    echo "kde-plasma/kdeplasma-addons didn't install lol"
    exit 1
fi
echo "Done!"

done

