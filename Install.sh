#!/bin/bash
##################################################################################
# 3 --------------------------- Copyright Info -----------------------------------
# Template by Dhanush <dhanushsandy91@gmail.com>
# Copyright (C) 2020 RadarLabs.Inc <www.radarlabs.com>
#
# 7 -------------------------- Default Variables ---------------------------------
file='Install.sh'	# File Name
type='Shell Script'     # File Type
date='2020-04-20'       # Created On
version='V1.0'          # Current Version
update='2020-04-20'     # Last Modified
# Discription
about='A Program Install Script'
more=(\
'	'\
)
# 20 -------------------------- Default Function ---------------------------------
moreFunc () {
j=0
for i in "${more[@]}"
do
        if [[ $j == 0 && $i != "	" ]]
        then
                echo "More      : $i"
                j=1
        else
                echo " $i"
        fi
done
}
# 34 --------------------------------- More --------------------------------------
# It Uses the -/sys/class/thermal/thermal_zone0/temp- to obtain the Temp of the
# SOC then calculates the Temp value using bc. If there is any change in the
# value, then in will update on the screen.
#
# 39 ------------------------------ File logs ------------------------------------
echo "---------------------------------------------------------------------------"
echo "File      : $file"
echo "Type      : $type"
echo "Created   : $date"
echo "Version   : $version $update"
echo " "
echo "About     : $about"
     moreFunc
echo "Author    : Dhanush [dhanushsandy91@gmail.com]"
echo "Website   : www.radarlabs.com"
echo "Copyright (C) 2020 RadarLabs.Inc"
echo "---------------------------------------------------------------------------"
echo $(date -u) "Script Started..."
##################################################################################

# 55 ----------------------------- Script Functions ------------------------------

# 56 ------------------------------- Main Script ---------------------------------

#------------------------------------ End Script ---------------------------------
