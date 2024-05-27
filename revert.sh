#!/bin/bash
echo
"###############################################################################
please enter the password 'makerbase' if prompted for a password (unless you've changed it, then obviously use that password)
###############################################################################"
sudo sed -i ‘s/deb.debian.org\/debian buster-backports/archive.debian.org\/debian buster-backports/g’ /etc/apt/sources.list
sudo mv ~/klipper_config/MKS_THR.cfg ~/klipper_config/MKS_THR.cfg.bak ; path=$(ls /dev/serial/by-id/*) ; printf "[mcu MKS_THR]\nserial:$path\n" > ~/klipper_config/MKS_THR.cfg
sudo service klipper stop ; sudo service moonraker stop
cd /home/mks
sudo rm -rf fluidd klipper klippy-env moonraker moonraker-env
echo "downloading qidi's klipper repo..."
wget --no-check-certificate https://raw.githubusercontent.com/billkenney/revert_qidi_software/main/klipper.tgz ; tar -xzf klipper.tgz ; rm klipper.tgz
echo "downloading qidi's moonraker repo..."
wget --no-check-certificate https://raw.githubusercontent.com/billkenney/revert_qidi_software/main/moonraker.tgz ; tar -xzf moonraker.tgz ; rm moonraker.tgz
echo "downloading fluidd 1.28..."
wget --no-check-certificate https://raw.githubusercontent.com/billkenney/revert_qidi_software/main/fluidd-1.28.tgz ; tar -xzf fluidd-1.28.tgz ; rm fluidd-1.28.tgz
echo "reinstalling klipper..."
chmod +x ~/klipper/scripts/install-debian.sh
sh ~/klipper/scripts/install-debian.sh
echo "reinstalling moonraker..."
chmod +x ~/moonraker/scripts/install-moonraker.sh
sh ~/moonraker/scripts/install-moonraker.sh
echo "klipper and moonraker have been installed from qidi's github repository, and fluidd has been updated to the latest version that works with qidi's modified software"
echo "turn your printer off and on and you should be good to go"
