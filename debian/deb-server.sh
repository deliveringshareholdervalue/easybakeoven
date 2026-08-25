#!/bin/bash
# easybakeoven logo
cat deb-art.txt
echo
echo
echo
echo "Life is hard, but deploying debian doesn't have to be!"
echo
sleep 1
# makes sure sudo is installed for execution of commands
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
# installs all necessary dependencies with a yes check automatically so no authentication needed
			sudo apt install -y curl git openssh-server cockpit fastfetch openjdk-25-jdk wget tmux ufw btop build-essential neovim nano ca-certificates gnupg
			# installs docker keyring
			sudo mkdir -p /etc/apt/keyrings
			curl -fsSL https://docker.com | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
			sudo chmod a+r /etc/apt/keyrings/docker.gpg
# installs docker modules needed for function
           sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
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
