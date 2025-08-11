#Author Notes: Spent quite some time in this script, but the learning process was worth it.
#Also, had a lot of fun doing it.
#
#Task description: Compose a script that responds to user input and uses other elements from earlier in the course.
#Set aside about 30 minutes build your script.

#!/usr/bin/env bash

declare -a opentasks
declare -a closedtasks

#load current tasks
while read f; do
	opentasks+=("$f")
done < ./texts/opentasks.txt

#load completed tasks
while read f; do
	closedtasks+=("$f")
done < ./texts/closedtasks.txt

#formatting
screen=$(tput cols)
teal="\033[36m"
pink="\033[35m"
normal="\033[0m"
yellow="\033[33m"
green="\033[32m"
red="\033[31m"

#show tasks
showtasks() {
echo ""
printf "$teal%s$normal \n" "📖 Open Tasks"
echo -e "$teal-----------------$normal"
for i in ${!opentasks[@]}; do
	echo "( ) " ${opentasks[i]}
done

echo ""
printf "$pink%s$normal \n" "📘 Closed tasks"
echo -e "$pink-----------------$normal"
for i in ${!closedtasks[@]}; do
	echo "✔️ " ${closedtasks[i]}
done
echo ""
echo "Press ENTER to show the menu"
echo ""

}

#add a new task
addnewtask() {
read -p "$(echo -e $yellow"Please add a new task: $normal")" newtask
opentasks+=("$newtask")
clear
showtasks
echo -e  $green"The task was succesfully added!$normal"
echo ""
}

#remove an open task
removeopentask(){
echo ""
for i in ${!opentasks[@]}; do
	echo "$i) ${opentasks[i]}"
done
echo ""
read -p "$(echo -e $yellow"Select the number of the task to be deleted: $normal")" tasknumber
local status=$red"Task not found!$normal"
if [[ $tasknumber =~ ^[0-9]+$ ]]; then
	for k in ${!opentasks[@]}; do
		if [[ ${opentasks[tasknumber]} = ${opentasks[k]} ]]; then
			unset opentasks[tasknumber]
			opentasks=("${opentasks[@]}")
			status=$green"The task was successfully removed!$normal"
			break
		fi
	done
fi
clear
showtasks
echo -e $status
echo ""
}

#remove a closed task
removeclosedtask(){
echo ""
for i in ${!closedtasks[@]}; do
	echo "$i) ${closedtasks[i]}"
done
echo ""
read -p "$(echo -e $yellow"Select the number of the task to be deleted: $normal")" tasknumber
local status=$red"Task not found!$normal"
if [[ $tasknumber =~ ^[0-9]+$ ]]; then
	for k in ${!closedtasks[@]}; do
		if [[ ${closedtasks[tasknumber]} = ${closedtasks[k]} ]]; then
			unset closedtasks[tasknumber]
			closedtasks=("${closedtasks[@]}")
			status=$green"The task was successfully removed!$normal"
			break
		fi
	done
fi
clear
showtasks
echo -e  $status
echo ""
}

#remove a task menu
removetask() {
echo ""
echo -e $yellow"From which list do you want to remove a task?$normal"
select list in "Open Tasks" "Closed Tasks"; do
	case $list in
		"Open Tasks") removeopentask; break;;
		"Closed Tasks") removeclosedtask; break;;
	esac
done
}

#close a task
closetask(){
echo ""
for i in ${!opentasks[@]}; do
	echo "$i) ${opentasks[i]}"
done
echo ""
read -p "$(echo -e $yellow"Select task to be closed: $normal")" tasknumber
local status=$red"Task not found!$normal"
if [[ $tasknumber =~ ^[0-9]+$ ]]; then
	for k in ${!opentasks[@]}; do
		if [[ ${opentasks[tasknumber]} = ${opentasks[k]} ]]; then
			closedtasks+=("${opentasks[tasknumber]}")
			unset opentasks[tasknumber]
			opentasks=("${opentasks[@]}")
			status=$green"The task was successfully closed!$normal"
			break
		fi
	done
fi
clear
showtasks
echo -e $status
echo ""
}

#clear all tasks
clearall() {
read -p "$(echo -e $red"This will erase all tasks! Do you want to proceed? [Y or N] $normal")" answer
if [[ $answer = "Y" || $answer = "y" ]]; then
	opentasks=()
	closedtasks=()
	clear
	showtasks
	echo -e $green"Tasks were successfully erased!$normal"
fi
}

#quit options
quitsave(){
read -p "$(echo -e  $yellow"Do you want to save and quit? [Y or N] $normal")" answer
if [[ $answer = "Y" || $answer = "y" ]];then
	> ./texts/opentasks.txt
	> ./texts/closedtasks.txt
	for i in ${!opentasks[@]}; do echo ${opentasks[i]} >> ./texts/opentasks.txt; done
	for i in ${!closedtasks[@]}; do echo ${closedtasks[i]} >> ./texts/closedtasks.txt; done
	exit
fi
}
quitonly(){
read -p "$(echo -e  $yellow"Do you want to quit without saving? [Y or N] $normal")" answer
if [[ $answer = "Y" || $answer = "y" ]];then
	exit
fi
}

#task from argument
argtask() {
	echo $1 >> ./texts/opentasks.txt
	echo "\"$1\" was added to your open tasks list!"
	exit
}

#arguments and options
while getopts a:h option; do
	case $option in
		a)task=$OPTARG; argtask "$task";;
		h)echo "Use option -a to add a task from the command line"; exit;;
	esac
done
#start
clear
showtasks

#menu
add="Add a new task"
remove="Remove a task"
close="Close a task"
clearall="Clear all tasks"
savequit="Save and quit"
justquit="Quit without saving"

select option in "$add" "$remove" "$close" "$clearall" "$savequit" "$justquit"; do
	case $option in
			$add) addnewtask;;
			$remove) removetask;;
			$close) closetask;;
			$clearall) clearall;;
			$savequit) quitsave;;
			$justquit) quitonly;;
	esac
done
