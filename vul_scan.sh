#!/bin/bash

# Take target's IP from user as input
read -p "Enter target's IP : " Target_IP

echo "What type of scan would you like to perform on target : "
echo "a) Scan  Status of all TCP ports"
echo "b) Vulnerability Scan"
echo "c) Brute force FTP attack"
echo "d) Detect Version"
echo "e) Detect Target's Operating System"

read Choose
case $Choose in
	a)echo "Scanning all TCP ports..."
		sudo nmap -sT "$Target_IP" >> "Output_1.txt"
		if [[ $? -eq 0 ]]
		then
			echo "Scan Complete! PLease refer Output_1.txt for output"
		else
			echo "Scan Failed"
		fi
		;;

	b)echo "Performing Vulnerability scan..."
		sudo nmap -sV --script=vulscan/vulscan.nse "$Target_IP" >> "Output_2.txt"
		if [[ $? -eq 0 ]]
		then
			echo "Scan Complete! PLease refer Output_2.txt for output"
		else
			echo "Scan Failed"
		fi
		;;
	c)echo "Performing brute force attack..."
		sudo nmap --script=ftp-brute.nse -T5  "$Target_IP" >> "Output_3.txt"
		if [[ $? -eq 0 ]]
		then
			echo "Scan Complete! Please refer Output_3.txt for Output"
		else
			echo "Scan Failed"
		fi
		;;
	d)echo "Detecting Version..."
		sudo nmap -sV "$Target_IP" >> "Output_4.txt"
		if [[ $? -eq 0 ]]
		then
			echo "Scan Complete! Please refer Output_4.txt for Output"
		else
			echo "Scan Failed"
		fi
		;;
	e)echo "Detecting Target's OS..."
		sudo nmap -O "$Target_IP" >> "Output_5.txt"
		if [[ $? -eq 0 ]]
		then
			echo "Scan Complete! Please refer Output_5.txt for Output"
		else
			echo "Scan Failed"
		fi
		;;
	*)echo "Please choode a valid option";;
esac



