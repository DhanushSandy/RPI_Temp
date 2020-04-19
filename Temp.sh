#!/bin/bash
##################################################################################
#
# 4 -------------------------- Default Variables ---------------------------------
file='Temp.sh'		# File Name
type='Shell Script'	# File Type
date='2020-04-19'	# Created On
version='V1.1'		# Current Version
update='2020-04-20'	# Last Modified
# Discription
about='A Simple Temperature monitor Script for Raspberry pi 1/2/3/4'
more=(\
'Requires bc to be loaded. If not then use $apt-get install bc' \
'	  Supports, Ubuntu 18.04 ' \
'	  ' \
)
# 15 ------------------------- Default Function ---------------------------------
moreFunc () {
j=0
for i in "${more[@]}"
do
       	if [ $j == 0 ]
        then
                echo "More	: $i"
                j=1
        else
                echo " $i"
        fi
done
}
#
# 30 ------------------------- Copyright Info -----------------------------------
# Script by Dhanush <dhanushsandy91@gmail.com>
# Copyright (C) 2020 RadarLabs.Inc <www.radarlabs.com>
#
# 34 -------------------------------- More --------------------------------------
# It Uses the -/sys/class/thermal/thermal_zone0/temp- to obtain the Temp of the
# SOC then calculates the Temp value using bc. If there is any change in the
# value, then in will update on the screen.
#
# 39 ----------------------------- File logs ------------------------------------
echo "--------------------------------------------------------------------------"
echo "File	: $file"
echo "Type	: $type"
echo "Created	: $date"
echo "Version	: $version $update"
echo " "
echo "About	: $about"
     moreFunc
echo "Author	: Dhanush [dhanushsandy91@gmail.com]"
echo "Website	: www.radarlabs.com"
echo "Copyright (C) 2020 RadarLabs.Inc"
echo "--------------------------------------------------------------------------"
echo $(date -u) "Script Started..."
#################################################################################

# 54 ---------------------------- Script Functions ------------------------------
currentTime () {
	date "+%Y/%m/%d %H:%M:%S"
}
barGraph () {
	str=""
	barCount=$(bc <<< "($1*25)/100")
	for ((i=0; i<25; i++))
	do
		if [ $i -lt $barCount ]
		then
			str+="|"
		else
			str+=" "
		fi
	done
        cal=$(bc -l <<< "$barCount/5 + 0.5")
        color=$(bc <<<"6 - $cal/1")
	echo "$(tput setaf $color)$str$(tput sgr0)"
	return 1
}
osCheck () {
	os=$(hostnamectl | grep 'Operating System')
	os=${os:19}
	if [[ $os =~ "Ubuntu" ]]
	then
		if [[ $os =~ "19" ]]
		then
			echo " "
		elif [[ $os =~ "18" ]]
                then
                        echo "/sys/class/thermal/thermal_zone0/temp"
                elif [[ $os =~ "16" ]]
		then
			echo " "
		fi
	elif [[ $os =~ "Debian" ]]
	then
		echo "vcgencmd measure_temp"
	fi
	return 1
}
# 96 ------------------------------ Main Script ---------------------------------
saved=0
echo "Status: Running; hit [CTRL+C] to stop!"
cmd=`osCheck`
#echo '$cmd"
while :
do
	data=$(cat $cmd)
	temp=$(bc -l <<< "scale=1; $data/1000")
	barStr=`barGraph $temp`
        	if [ $temp != $saved ]
		then
			echo -ne "[$file] $(currentTime) [CPU: $barStr $temp'C]"\\r
			sleep 1
		fi
done
#----------------------------------- End Script --------------------------------
