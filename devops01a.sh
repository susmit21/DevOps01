#!/bin/bash

get_system_data()
{
>sysinfo
printf "############# Number of volumes ###############\n\n" >> sysinfo
diskutil list >> sysinfo

printf "############ Number of volumes, Size of each volume, Free space on each volume  #############\n\n" >> sysinfo
df -h >> sysinfo

}

get_system_data
