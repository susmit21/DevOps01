#!/bin/bash

get_system_data()
{
>sysinfo
printf "############# Number of volumes ###############\n\n" >> sysinfo
diskutil list >> sysinfo


}

get_system_data
