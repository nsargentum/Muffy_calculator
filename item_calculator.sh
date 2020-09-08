#!/bin/bash

function color_definition(){
	    NORMAL=`echo "\033[m"`
		MENU=`echo "\033[36m"` #Blue
		NUMBER=`echo "\033[33m"` #yellow
		FGRED=`echo "\033[41m"`
		RED_TEXT=`echo "\033[31m"`
		ENTER_LINE=`echo "\033[33m"`
}

function option_picked() {
		COLOR='\033[01;31m' # bold red
	    RESET='\033[00;00m' # normal white
		MESSAGE=${@:-"${RESET}Error: No message passed"}
		echo -e "${COLOR}You chose to ${MESSAGE}${RESET}"
}

show_menu(){
	echo -e "
${FGRED}
  _______ .-. .-.,---.     ,--,    .---.   .---.  ,'|\"\\            .-. .-.,---.,---..-.   .-.
 |__   __|| | | || .-'   .' .'    / .-. ) / .-. ) | |\\ \\   |\\    /|| | | || .-'| .-' \\ \\_/ )/
   )| |   | \`-' || \`-.   |  |  __ | | |(_)| | |(_)| | \\ \\  |(\\  / || | | || \`-.| \`-.  \\   (_)
  (_) |   | .-. || .-'   \\  \\ ( _)| | | | | | | | | |  \\ \\ (_)\\/  || | | || .-'| .-'   ) (   
    | |   | | |)||  \`--.  \\  \`-) )\\ \`-' / \\ \`-' / /(|\`-' / | \\  / || \`-')|| |  | |     | |   
    \`-'   /(  (_)/( __.'  )\\____/  )---'   )---' (__)\`--'  | |\\/| |\`---(_))\\|  )\\|    /(_|   
         (__)   (__)     (__)     (_)     (_)              '-'  '-'      (__) (__)   (__)    
${NORMAL}"

	echo -e "${MENU}*********************************************${NORMAL}"
	echo -e "${MENU}**${NUMBER} 1)${MENU} Chocolate Alfajor${NORMAL}"
	echo -e "${MENU}**${NUMBER} 2)${MENU} Alfajor Maizena ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 3)${MENU} Marquisse ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 4)${MENU} ChocoTorta ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 5)${MENU} ChocoOreo ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 6)${MENU} Ice Cream ${NORMAL}" 
	echo -e "${MENU}**${NUMBER} 7)${MENU} Coconut Madness ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 8)${MENU} Dream Cone${NORMAL}"
	echo -e "${MENU}*********************************************${NORMAL}"
	echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
	read opt
	while [ opt != '' ]
		do
			if [[ $opt = "" ]]; then
				exit;
			else
				case $opt in
 				1) clear; 
				option_picked "Calculate Chocolate Alfajor"
				sleep 2 
				calculate_choco_alf "Chocolate Alfajor"
				show_menu;
				;;      				
				2) clear; 
				option_picked "Calculate Alfajor Maizena"
				sleep 2				
				calculate_maiz_alf "Alfajor Maizena"
				show_menu;
				;;     
 				3) clear; 
				option_picked "Calculate Marquisse"
				sleep 2
				calculate_marquisse	"Marquisse"
				show_menu;
				;;     
 				4) clear; 
				option_picked "Calculate ChocoTorta"
				sleep 2				
				calculate_chocotorta "ChocoTorta"
				show_menu;
				;;     
 				5) clear; 
				option_picked "Calculate ChocoOreo"
				sleep 2
				calculate_choco_oreo "ChocoOreo"
				show_menu;
				;;     
 				6) clear; 
				option_picked "Calculate Ice Cream"
				sleep 2				
				calculate_icecream "Ice Cream Pint"
				show_menu;
				;;     
 				7) clear; 
				option_picked "Calculate Coconut Madness"
				sleep 2
				calculate_coconut_madness "Coconut Madness Slice"
				show_menu;
				;;     
				8) clear;                                                             
				option_picked "Calculate Dream Cone"
				sleep 2			
				calculate_dream_cone "Dream Cone"
				show_menu;                                                             
				;;
				*)clear;
				option_picked "Pick an option from the menu";
				show_menu;
				;;
				esac
		fi
		done
}

function object_number(){
local_1=$1
	echo -e "${NUMBER}Enter the Number of $1(s) that you'd like to calculate${NORMAL}"
	read number_of_objects
	if ! [[ "$number_of_objects" =~ ^[0-9]+$ ]]
		then
			echo -e "${FGRED}Please enter a number of $1(s) (integers only) equal to 1 or greater${NORMAL}"
			sleep 2
			clear
			object_number	    
	fi
	if [[ "$number_of_objects" -lt 1 ]]
	        then
        	        echo -e "${FGRED}Sorry, but your number of $1(s) must be positive.${NORMAL}"
			sleep 2
			clear	
			object_number
	        fi
	while true;
		do
			read -p "The number of $local_1(s) you chose was [[$number_of_objects]]. Do you wish to proceed? " yn
			case $yn in
				[Yy]* )
					break
					;;
				[Nn]* )
					show_menu
				;;
			* ) echo -e "${NUMBER}Please answer yes or no.${NORMAL}";;
			esac
		done

}

function calculate_choco_alf(){
	object_number "$1"
	if [[ $number_of_objects -lt 6 ]]
		then 
			cost="\$2.50"
			total=$(echo $number_of_objects|awk '{multiply = $1 * 2.5; print multiply}') 	
	elif (( $number_of_objects >= 6 && $number_of_objects < 12 ))
		then
			cost="\$2.00"
			total=$(echo $number_of_objects|awk '{multiply = $1 * 2; print multiply}') 
	elif [[ $number_of_objects -gt 11 ]]
		then
			cost="\$1.67"
			total=$(echo $number_of_objects|awk '{multiply = $1 * 1.67; print multiply}') 	
	fi
	printTable ',' "$(printf "Item Name,Number of Item, Cost Per Unit,Total\n$(echo $1),$number_of_objects, $cost,\$$total")"
}

function calculate_maiz_alf(){
	object_number "$1"
	if [[ $number_of_objects -lt 6 ]]
		then 
			cost="1.5"
			total=$(echo $number_of_objects|awk '{multiply = $1 * 1.5; print multiply}') 	
	elif (( $number_of_objects >= 6 && $number_of_objects < 12 ))
		then
			cost="1.33"
			total=$(echo $number_of_objects|awk '{multiply = $1 * 1.33; print multiply}') 
	elif [[ $number_of_objects -gt 11 ]]
		then
			cost="1"
			total=$(echo $number_of_objects|awk '{multiply = $1 * 1; print multiply}') 	
	fi
	printTable ',' "$(printf "Item Name,Number of Item, Cost Per Unit,Total\n$(echo $1),$number_of_objects, $cost,\$$total")"
}
function calculate_marquisse(){
	object_number "$1"
	cost="\$6.00"
	total=$(echo $number_of_objects|awk '{multiply = $1 * 6; print multiply}')
	printTable ',' "$(printf "Item Name,Number of Item, Cost Per Unit,Total\n$(echo $1),$number_of_objects, $cost,\$$total")"
}
function calculate_chocotorta(){
	object_number "$1"
	cost="\$6.00"
	total=$(echo $number_of_objects|awk '{multiply = $1 * 6; print multiply}')
	printTable ',' "$(printf "Item Name,Number of Item, Cost Per Unit,Total\n$(echo $1),$number_of_objects, $cost,\$$total")"
}
function calculate_choco_oreo(){
	object_number "$1"
	cost="\$6.00"
	total=$(echo $number_of_objects|awk '{multiply = $1 * 6; print multiply}')
	printTable ',' "$(printf "Item Name,Number of Item, Cost Per Unit,Total\n$(echo $1),$number_of_objects, $cost,\$$total")"
}
function calculate_icecream(){
	object_number "$1"
	cost="\$6.00"
	total=$(echo $number_of_objects|awk '{multiply = $1 * 6; print multiply}')
	printTable ',' "$(printf "Item Name,Number of Item, Cost Per Unit,Total\n$(echo $1),$number_of_objects, $cost,\$$total")"
}
function calculate_coconut_madness(){
	object_number "$1"
	cost="\$3.00"
	total=$(echo $number_of_objects|awk '{multiply = $1 * 3; print multiply}')
	printTable ',' "$(printf "Item Name,Number of Item, Cost Per Unit,Total\n$(echo $1),$number_of_objects, $cost,\$$total")"
}
function calculate_dream_cone(){
	object_number "$1"
	if [[ $number_of_objects -lt 6 ]]
		then 
			cost="1.5"
			total=$(echo $number_of_objects|awk '{multiply = $1 * 1.5; print multiply}') 	
	elif (( $number_of_objects >= 6 && $number_of_objects < 12 ))
		then
			cost="1.33"
			total=$(echo $number_of_objects|awk '{multiply = $1 * 1.33; print multiply}') 
	elif [[ $number_of_objects -gt 11 ]]
		then
			cost="1"
			total=$(echo $number_of_objects|awk '{multiply = $1 * 1; print multiply}') 	
	fi
	printTable ',' "$(printf "Item Name,Number of Item, Cost Per Unit,Total\n$(echo $1),$number_of_objects, $cost,\$$total")"
}

function printTable()
{
    local -r delimiter="${1}"
    local -r data="$(removeEmptyLines "${2}")"

    if [[ "${delimiter}" != '' && "$(isEmptyString "${data}")" = 'false' ]]
    then
        local -r numberOfLines="$(wc -l <<< "${data}")"

        if [[ "${numberOfLines}" -gt '0' ]]
        then
            local table=''
            local i=1

            for ((i = 1; i <= "${numberOfLines}"; i = i + 1))
            do
                local line=''
                line="$(sed "${i}q;d" <<< "${data}")"

                local numberOfColumns='0'
                numberOfColumns="$(awk -F "${delimiter}" '{print NF}' <<< "${line}")"

                # Add Line Delimiter

                if [[ "${i}" -eq '1' ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi

                # Add Header Or Body

                table="${table}\n"

                local j=1

                for ((j = 1; j <= "${numberOfColumns}"; j = j + 1))
                do
                    table="${table}$(printf '#| %s' "$(cut -d "${delimiter}" -f "${j}" <<< "${line}")")"
                done

                table="${table}#|\n"

                # Add Line Delimiter

                if [[ "${i}" -eq '1' ]] || [[ "${numberOfLines}" -gt '1' && "${i}" -eq "${numberOfLines}" ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi
            done

            if [[ "$(isEmptyString "${table}")" = 'false' ]]
            then
                echo -e "${table}" | column -s '#' -t | awk '/^\+/{gsub(" ", "-", $0)}1'
            fi
        fi
    fi
}

function removeEmptyLines()
{
    local -r content="${1}"

    echo -e "${content}" | sed '/^\s*$/d'
}

function repeatString()
{
    local -r string="${1}"
    local -r numberToRepeat="${2}"

    if [[ "${string}" != '' && "${numberToRepeat}" =~ ^[1-9][0-9]*$ ]]
    then
        local -r result="$(printf "%${numberToRepeat}s")"
        echo -e "${result// /${string}}"
    fi
}

function isEmptyString()
{
    local -r string="${1}"

    if [[ "$(trimString "${string}")" = '' ]]
    then
        echo 'true' && return 0
    fi

    echo 'false' && return 1
}

function trimString()
{
    local -r string="${1}"

    sed 's,^[[:blank:]]*,,' <<< "${string}" | sed 's,[[:blank:]]*$,,'
}
color_definition
show_menu
