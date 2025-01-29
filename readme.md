# revert qidi software
this script is for the max3/plus3/smart3. it will revert your klipper and moonraker to working versions from qidi's repository, and it will install the latest working version of fluidd

using a terminal client such as putty for windows, terminal on macos or linux, or an app like shelly or terminus on your phone, ssh into your printer

the first 2.5 min of this video shows you how to use putty to connect if you're on windows: https://m.youtube.com/watch?v=KQVQOq0Tpgo

if you have mac you can use the terminal app. just type in ssh mks@192.168.1.xxx and press enter (replace '192.168.1.xxx' with your printers ip address)

the username is 'mks' and the password is 'makerbase' any time you are prompted for a password (unless you changed it)

if you get an ssl certificate error downloading the script, or if you have to reinstall klipper/moonraker, you need to make sure your date and time is correct. ssh into your printer and run `date`. if the date is incorrect, find your time zone here: https://en.m.wikipedia.org/wiki/List_of_tz_database_time_zones (it should be in the format America/Chicago), then run `sudo timedatectl set-timezone [your_timezone] ; sudo timedatectl set-ntp 1` replacing [your_timezone] with your actual timezone. run `date` again and make sure its correct. if its not, follow the steps here to fix it before proceeding: https://wiki.qidi3d.com/en/Memo/System-Time-Modification

# download and run the recovery script

1. paste this into the terminal interface and press enter (enter 'makerbase' if prompted for your password again): `cd ~ ; wget --no-check-certificate https://raw.githubusercontent.com/billkenney/revert_qidi_software/main/revert.sh ; chmod +x revert.sh ; ./revert.sh`

2. the script shouldn't take long, maybe around a minute depending on your internet connection. once its done, turn your printer off and on and you should be good to go

3. after rebooting your printer, if its not working, run `sudo service klipper status` and make sure it does not say 'failed', 'exited', service not found, or any other error code. also run `sudo service moonraker status` and make sure it does not say 'failed', 'exited', service not found, or any other error code

# if klipper or moonraker is not working after running the script

if klipper is not working properly after running the script, run `chmod +x /home/mks/klipper/scripts/install-debian.sh ; /home/mks/klipper/scripts/install-debian.sh`. after the install is finished, check to make sure the service is working properly `sudo service klipper status`

if moonraker is not working properly, run `chmod +x /home/mks/moonraker/scripts/install-moonraker.sh ; /home/mks/moonraker/scripts/install-moonraker.sh`. after the install is finished, check to make sure the service is working properly `sudo service moonraker status`

# if you encounter a white screen when navigating to http://printer.ip.address:10088, or a screen that just shows your webcam

if you encounter a white screen when navigating to http://printer.ip.address:10088, or a screen that just shows your webcam, fluidd may not have installed properly. ssh into your printer and run the following command: `cd /home/mks ; rm -rf fluidd ; wget --no-check-certificate https://raw.githubusercontent.com/billkenney/revert_qidi_software/main/fluidd-1.28.tgz ; tar -xzf fluidd-1.28.tgz ; rm fluidd-1.28.tgz`

# if the printer or screen are still not working, reinstall the firmware, or write a recovery image to the emmc

follow the steps here to reinstall the firmware: https://github.com/billkenney/qidi_3series_recovery/blob/main/README.md

if it still doesn't work, you may need a new emmc, contact qidi support about this. if you already have an emmc adapter, follow these instructions to write the recovery image to your emmc: https://wiki.qidi3d.com/en/Memo/flash-emmc. update the firmware after booting into the newly flashed image (follow the guide in the previous paragraph)

# write the xindi recovery image to your existing emmc without an adapter

you can also boot from a flash drived plugged into the printer if you don't have an adapter. i have a max3, and i was able to get it to boot by removing the wifi module and plugging the flash drive into that usb port--i don't know if it works with other ports. i also had to reboot a few times before i was able to ssh into this. if you are able to do this, you can write the xindi image to your emmc without an adapter--although you still need the 32gb emmc module. once you've written the xindi recovery image (from qidi's wiki) to the flash drive, plug it into that port. format a second flash drive in exfat, copy the xindi image file to that flash drive, plug it into another usb port on the printer, and turn it on. ssh into the printer (if you can't after a few minutes, turn it off and on again--repeat until it works). check the path to the second flash drive with `lsblk`, mount it, and write the image to your emmc module. first check that '/dev/mmcblk1' is in the list of hard drives, that is your emmc. the second flash drive will probably be '/dev/sdb1' (it's the one that doesn't have the boot volume next to it). if it is /dev/sdb1 you'd run `sudo umount /dev/sdb1 ; sudo mount /dev/sdb1 /mnt`. check to make sure the xindi image is in there: `ls /mnt`, this should return 'xindi-20230309.img'. if the image is there, run `sudo dd if=/mnt/xindi-20230309.img of=/dev/mmcblk0 bs=32M status=progress`. replace '/dev/mmcblk0' with the path to your emmc

you need to update your firmware and install the correct printer.cfg after writing the xindi image to your emmc. follow these steps to reinstall the firmware and update the printer.cfg: https://github.com/billkenney/qidi_3series_recovery
