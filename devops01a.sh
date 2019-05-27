#!/bin/bash

get_system_data()
{
>sysinfo
printf "############# Number of volumes ###############\n\n" >> sysinfo
diskutil list >> sysinfo

printf "############ Number of volumes, Size of each volume, Free space on each volume  #############\n\n" >> sysinfo
df -h >> sysinfo

printf "############ Number of CPUs ################\n\n" >> sysinfo
sysctl -n hw.ncpu >> sysinfo

printf "############ CPU Info ###################\n\n" >> sysinfo
sysctl -n machdep.cpu.brand_string >> sysinfo

printf "############ Memory Size #################\n\n" >> sysinfo
sysctl hw.memsize >> sysinfo

printf "############ MAC address ################\n\n" >> sysinfo
ifconfig en0 | grep ether >> sysinfo

printf "############ IP address #################\n\n" >> sysinfo
ifconfig en0 | grep inet >> sysinfo

}

get_system_data
