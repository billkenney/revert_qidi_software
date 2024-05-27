this script will revert your klipper/moonraker to working versions from qidi's repository, if you've accidentally updated, and it will install the latest working version of fluidd

1. using a terminal client such as putty on Windows, terminal on mac/linux, or shelly/terminus on your phone, ssh into your printer `ssh mks@printer.ip.address` (the ssh and sudo password is makerbase unless you've changed it)
2. find your time zone here: https://en.m.wikipedia.org/wiki/List_of_tz_database_time_zones. it should be in the format America/Chicago
3. run `sudo timedatectl set-timezone [your_timezone] ; sudo timedatectl set-ntp 1` obviously replacing [your_timezone] with your actual timezone
4. run `cd ~ ; wget --no-check-certificate https://raw.githubusercontent.com/billkenney/revert_qidi_software/main/revert.sh ; chmod +x revert.sh ; ./revert.sh`
5. the script shouldn't take long, maybe around a minute depending on your internet connection. once its done, turn your printer off and on and you should be good to go
6. if klipper is not working properly after running the script, ssh into your printer and run `chmod +x /home/mks/klipper/scripts/install-debian.sh ; /home/mks/klipper/scripts/install-debian.sh`
7. if moonraker is not working properly, ssh into your printer and run `chmod +x /home/mks/moonraker/scripts/install-moonraker.sh ; /home/mks/moonraker/scripts/install-moonraker.sh`
