#!/bin/bash
echo
"###############################################################################
please enter the password 'makerbase' if prompted for a password (unless you've changed it, then obviously use that password)
###############################################################################"
sudo sed -i ‘s/deb.debian.org\/debian buster-backports/archive.debian.org\/debian buster-backports/g’ /etc/apt/sources.list
cd /home/mks
sudo rm -rf fluidd klipper klippy-env moonraker moonraker-env
echo "downloading qidi's klipper repo..."
wget --no-check-certificate 'https://codeload.github.com/QIDITECH/klipper/zip/refs/heads/main' -O klipper.zip ; unzip klipper.zip ; rm klipper.zip
echo "downloading qidi's moonraker repo..."
wget --no-check-certificate 'https://codeload.github.com/QIDITECH/moonraker/zip/refs/heads/main' -O moonraker.zip ; unzip moonraker.zip ; rm moonraker.zip
echo "downloading fluidd 1.28..."
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Essar3y789UNelY1G5T_Dro7V41O4m4K' -O fluidd-1.28.tgz ; tar -xzf fluidd-1.28.tgz ; rm fluidd-1.28.tgz
echo "reinstalling klipper..."
chmod +x ~/klipper/scripts/install-debian.sh
sh ~/klipper/scripts/install-debian.sh
echo "reinstalling moonraker..."
chmod +x ~/moonraker/scripts/install-moonraker.sh
sh ~/moonraker/scripts/install-moonraker.sh
sudo service klipper restart ; sudo service moonraker restart
echo "working versions of klipper and moonraker have been installed from qidi's github repository, and fluidd has been updated to the latest version that works with qidi's modified software"
echo "turn your printer off and on and you should be good to go"
