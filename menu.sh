#!/bin/bash

# ==================================================================== #
# Blankon Manokwari Theme Changer Script
# version 0.1.324
# by Ari Effendi
# arieffendi@gmail.com
# license under GPLv3
# ==================================================================== #

#some code based from
#http://w.blankon.in/ep
#http://w.blankon.in/UV
#http://w.blankon.in/XV
#http://w.blankon.in/YV

function backup {
	echo "Backup old theme..."

	if [ ! -d "$PWD/backup" ]; then
		mkdir "$PWD/backup"
	fi

	cp -R /usr/lib/manokwari/system/ "$PWD/backup/"
	sudo rm -R /usr/lib/manokwari/system/

	echo	"Succes backup Manokwari theme..."
}

function change {
	# List theme folder ====================================================
	#clear
	echo "List of avaiable theme"
	echo ""

	FILE=($(ls | grep manokwari))

	for i in ${FILE[*]}; do
		echo " $(($COUNT+1)) $i"
		let COUNT++;
	done

	# Get file index =======================================================
	echo ""
	echo -n "Insert number of theme to install: "
	read index

	echo -n "Want backup old theme [Y/n]: "

	read backup

	if [[ ${FILE[$index-1]} != "" ]]; then
		# Backup old theme  ================================================
		if [[ $backup == "y" && $backup != "" ]]; then
			backup
		fi

		# Install new theme ================================================
		echo "Install new theme..."

		sudo cp -R $PWD/${FILE[$index-1]}/system/ /usr/lib/manokwari/

		echo "Restart manokwari..."
		killall manokwari
	fi

	echo "Succes change Manokwari theme..."
}

function menu {
	echo "=================================================================="
	echo "  Blankon Theme Changer Script"
	echo "  version 0.1.327"
	echo "------------------------------------------------------------------"
	echo "You can use following function"
	echo ""
	echo " 1 Change manokwari theme"
	echo " 2 Backup manokwari theme"
	echo " 3 Restore manokwari theme"
	echo ""
	echo " Q Quit"
	echo ""
}

function restart-manokwari {
	killall manokwari
}

function restore {
	echo "Restore theme..."

	if [  -d "$PWD/backup" ]; then

		sudo cp -R $PWD/backup/system/ /usr/lib/manokwari/

	fi

	echo "Succes restore Manokwari theme..."
}

PWD=($(pwd))

menu
echo -n "Enter option number and press [ENTER]: "
read option	

case $option in
	1)
		change
		;;
	2)
		backup
		;;
	3)
		restore
		;;
	q|Q)
		exit
		;;
	esac

echo -n	"Press [ENTER] to quit..."
read end
