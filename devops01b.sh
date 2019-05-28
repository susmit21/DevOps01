#!/bin/bash

> sysinfo


if [ $# -ne 1 ];then
	printf "Available options:\n"
	printf -- "-volumes : Displays volumes, used and free size\n"
	printf -- "    -cpu : Displays number of CPUs in use and type of CPU\n"
	printf -- "    -ram : Displays size of the memory\n"
	printf -- "-network : Displays IP and MAC address\n"
	printf -- "    -all : Displays output of all the above options\n"

elif [ "$1" == "-volumes" ]; then
	printf "############# Number of volumes ###############\n\n" >> sysinfo
	df -h >> sysinfo

elif [ "$1" == "-cpu" ];then
	printf "############# Number of CPUs ###############\n\n" >> sysinfo
        sysctl -n hw.ncpu >> sysinfo
	printf "############ CPU Info ####################\n\n" >> sysinfo
	sysctl -n machdep.cpu.brand_string >> sysinfo

elif [ "$1" == "-ram" ];then
	printf "############# Size of the RAM ###############\n\n" >> sysinfo
        sysctl -n hw.memsize >> sysinfo

elif [ "$1" == "-network" ];then
	printf "############# IP Adress ###############\n\n" >> sysinfo
        ifconfig en0 | grep inet >> sysinfo

	printf "\n\n############# MAC Adress ###############\n\n" >> sysinfo
        ifconfig en0 | grep ether >> sysinfo

elif [ "$1" == "-all" ];then
	printf "############# Number of volumes ###############\n\n" >> sysinfo
        df -h >> sysinfo
	printf "############# Number of CPUs ###############\n\n" >> sysinfo
        sysctl -n hw.ncpu >> sysinfo 
	printf "############ CPU Info ####################\n\n" >> sysinfo
        sysctl -n machdep.cpu.brand_string >> sysinfo
	printf "############# Size of the RAM ###############\n\n" >> sysinfo
        sysctl -n hw.memsize >> sysinfo
	printf "############# IP Adress ###############\n\n" >> sysinfo
        ifconfig en0 | grep inet >> sysinfo
        printf "\n\n############# MAC Adress ###############\n\n" >> sysinfo
        ifconfig en0 | grep ether >> sysinfo

else
        printf "Available options:\n"
        printf -- "-volumes : Display volumes, used and free size\n"
        printf -- "    -cpu : Display number of CPUs in use and type of CPU\n"
        printf -- "    -ram : Display size of the memory\n"
        printf -- "-network : Display IP and MAC address\n"
        printf -- "    -all : Display output of all the above options\n"

fi

