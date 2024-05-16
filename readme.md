this script will revert your klipper/moonraker to working versions from qidi's repository, if you've accidentally updated. 

1. using a terminal client such as putty on Windows, terminal on mac/linux, or shelly/terminus on your phone, ssh into your printer `ssh mks@printer.ip.address` (the password is makerbase
2. find your time zone here: https://en.m.wikipedia.org/wiki/List_of_tz_database_time_zones. it should be in the format America/Chicago
3. run `sudo timedatectl set-timezone [your_timezone] ; sudo timedatectl set-ntp 1` obviously replacing [your_timezone] with your actual timezone
4. 
