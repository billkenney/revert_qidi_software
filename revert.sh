#!/bin/bash
echo
"###############################################################################
please enter the password 'makerbase' when prompted for a password (unless you've changed it, then obviously use that password)
###############################################################################"
cd /home/mks
sudo rm -rf fluidd klipper moonraker
echo "cloning qidi's klipper repo..."
git clone https://github.com/QIDITECH/klipper.git
echo "cloning qidi's moonraker repo..."
git clone https://github.com/QIDITECH/moonraker.git
echo "downloading fluidd 1.28..."
wget 'https://docs.google.com/uc?export=download&id=1Essar3y789UNelY1G5T_Dro7V41O4m4K' -O fluidd-1.28.tgz
tar -xzf fluidd-1.28.tgz
rm fluidd-1.28.tgz
sudo service klipper restart ; sudo service moonraker restart
echo "working versions of klipper and moonraker have been installed from qidi's github repository, and fluidd has been updated to the latest version that works with qidi's modified software"
echo "turn your printer off and on and you should be good to go"
