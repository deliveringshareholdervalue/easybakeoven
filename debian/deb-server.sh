#!/bin/bash
cat deb-art.txt
echo
echo
echo
echo "Life is hard, but deploying debian doesn't have to be!"
echo
sleep 1
if ! command -v sudo &> /dev/null; then
	echo "sudo is not installed, please install. exiting script" >&2
	exit 1
fi 

echo "sudo is available! Starting script!"
echo
sleep 1
while true; do
	read -p "Download packages? (y/n): " yn
	case $yn in 
		[Yy]* )
			echo "Vamanos!"

			sudo apt update

			sudo apt install -y curl git openssh cockpit fastfetch openjdk-25-jdk wget tmux ufw btop build-essential 
			break
			;;
		[Nn]* )
			echo "Installation aborted!"
			exit 0 
			;;
		* )
			echo "Please select yes or no."
			;;

		esac

	done
