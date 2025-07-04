#!/bin/bash

echo This script will install various app-stores for debian. You will be asked if you want to install each program.

if ping -q -c1 -W1 8.8.8.8 >/dev/null 2>&1; then

	
	sleep 1
	read -p "This first part will install flatpak. Do you want to continue? y/n  " flatpak_cont

  if [[ "$flatpak_cont" =~ "y" ]]; then

 	
	sudo apt-get install -y flatpak
        sudo apt-get install -y gnome-software-plugin-flatpak
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

	elif [[ "$flatpak_cont" =~ "n" ]]; then
        echo Exiting installation
        exit
    fi

    sleep 1
    bash <(curl -sSL https://raw.githubusercontent.com/Spectraetek/Linux-stuffs-and-utils/refs/heads/main/ffmpeg.sh)

    if [[ "$flatpak_cont" =~ "y" ]]; then
        read -p "System needs to restart to finish installation. Restart now? y/n " reboot
        if [[ "$reboot" =~ "y" ]]; then
            echo rebooting
            sleep 1
            sudo reboot
        fi
    fi

	echo done

else
    echo You are offline, An internet connection is neccesary (or google is down :P)
fi
