# revert qidi software
this script is for the max3/plus3/smart3. it will revert your klipper and moonraker to working versions from qidi's repository, and it will install the latest working version of fluidd

using a terminal client such as putty for windows, Terminal on macos or linux, or an app like shelly or terminus on your phone, ssh into your printer: `ssh mks@printer.ip.address` replacing 'printer.ip.address' with your printers ip address. the username is 'mks' and the password is 'makerbase' any time you are prompted for a password (unless you changed it)

if you get an ssl error when trying to download the script, find your time zone here: https://en.m.wikipedia.org/wiki/List_of_tz_database_time_zones (it should be in the format America/Chicago), then run `sudo timedatectl set-timezone [your_timezone] ; sudo timedatectl set-ntp 1` replacing [your_timezone] with your actual timezone. you will need to fix the date/time if you have to reinstall klipper and/or moonraker

# download and run the recovery script

1. run `cd ~ ; wget --no-check-certificate https://raw.githubusercontent.com/billkenney/revert_qidi_software/main/revert.sh ; chmod +x revert.sh ; ./revert.sh`

2. the script shouldn't take long, maybe around a minute depending on your internet connection. once its done, turn your printer off and on and you should be good to go

3. after rebooting your printer, run `sudo service klipper status` and make sure it does not say 'failed', 'exited', service not found, or any other error code. also run `sudo service moonraker status` and make sure it does not say 'failed', 'exited', service not found, or any other error code

# if klipper or moonraker is not working after running the script

4. if klipper is not working properly after running the script, run `chmod +x /home/mks/klipper/scripts/install-debian.sh ; /home/mks/klipper/scripts/install-debian.sh`. after the install is finished, check to make sure the service is working properly `sudo service klipper status`

5. if moonraker is not working properly, run `chmod +x /home/mks/moonraker/scripts/install-moonraker.sh ; /home/mks/moonraker/scripts/install-moonraker.sh`. after the install is finished, check to make sure the service is working properly `sudo service moonraker status`

# if the printer or screen are still not working, reinstall the firmware, or write a recovery image to the emmc

6. follow the steps here to reinstall the firmware: https://github.com/billkenney/qidi_3series_recovery/blob/main/README.md

7. if it still doesn't work, you may need a new emmc, contact qidi support about this. if you already have an emmc adapter, follow these instructions to write the recovery image to your emmc: https://wiki.qidi3d.com/en/Memo/flash-emmc. update the firmware after booting with the newly flashed image (step 6)

# write the xindi recovery image to your existing emmc without an adapter

8. someone posted that you can write the xindi image to a flash drive, plug it into the motherboard, and it will boot from the flash drive instead of the emmc. if you are able to do this, you can write the xindi image to your emmc without an adapter. first copy the xindi image file to a second flash drive and plug that into your printer, ssh into the printer, and check the path to the second flash drive with `sudo lsblk`, mount it, and write the image to your emmc module. first check that '/dev/mmcblk0' or '/dev/mmcblk1' is in the list of hard drives, this is your emmc. the second flash drive will probably be '/dev/sdb1', in which case you run `sudo umount /dev/sdb1 ; sudo mount /dev/sdb1 /mnt`. check to make sure the xindi image is there: `ls /mnt`, this should return 'xindi-20230309.img'. if the image is there, run `sudo dd if=/mnt/xindi-20230309.img of=/dev/mmcblk0 bs=32M status=progress`. replace '/dev/mmcblk0' with the path to your emmc
