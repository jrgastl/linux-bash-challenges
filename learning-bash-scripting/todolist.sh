#Compose a script that responds to user input and uses other elements from earlier in the course.
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

#show tasks
showtasks() {
echo ""
echo "Open tasks"
echo "----------"
echo ""
for i in ${!opentasks[@]}; do
	echo "( ) " ${opentasks[i]}
done

echo ""
echo "Closed tasks"
echo "------------"
echo ""
for i in ${!closedtasks[@]}; do
	echo "(X) " ${closedtasks[i]}
done
echo ""
echo "Press ENTER to show the menu"
echo ""

}

#add a new task
addnewtask() {
read -p "Please add a new task: " newtask
opentasks+=("$newtask")
clear
showtasks
echo ""
echo "Your task was succesfully added"
}

#remove an open task
removeopentask(){
for i in ${!opentasks[@]}; do
	echo "$i ${opentasks[i]}"
done
read -p "Select the number of the task to be deleted: " tasknumber
local status="Task not found!"
if [[ $tasknumber =~ ^[0-9]+$ ]]; then
	for k in ${!opentasks[@]}; do
		if [[ ${opentasks[tasknumber]} = ${opentasks[k]} ]]; then
			unset opentasks[tasknumber]
			opentasks=("${opentasks[@]}")
			status="Your task was successfully removed!"
			break
		fi
	done
fi
clear
showtasks
echo $status
}

#remove a closed task
removeclosedtask(){
for i in ${!closedtasks[@]}; do
	echo "$i ${closedtasks[i]}"
done
read -p "Select the number of the task to be deleted: " tasknumber
local status="Task not found!"
if [[ $tasknumber =~ ^[0-9]+$ ]]; then
	for k in ${!closedtasks[@]}; do
		if [[ ${closedtasks[tasknumber]} = ${closedtasks[k]} ]]; then
			unset closedtasks[tasknumber]
			closedtasks=("${closedtasks[@]}")
			status="Your task was successfully removed!"
			break
		fi
	done
fi
clear
showtasks
echo $status
}

#remove a task menu
removetask() {

echo "From which list do you want to remove a task?"
select list in "Open Tasks" "Closed Tasks"; do
	case $list in
		"Open Tasks") removeopentask; break;;
		"Closed Tasks") removeclosedtask; break;;
	esac
done
}

#close a task
closetask(){
for i in ${!opentasks[@]}; do
	echo "$i ${opentasks[i]}"
done
read -p "Select task to be closed: " tasknumber
local status="Task not found!"
if [[ $tasknumber =~ ^[0-9]+$ ]]; then
	for k in ${!opentasks[@]}; do
		if [[ ${opentasks[tasknumber]} = ${opentasks[k]} ]]; then
			closedtasks+=("${opentasks[tasknumber]}")
			unset opentasks[tasknumber]
			opentasks=("${opentasks[@]}")
			status="Your task was successfully closed!"
			break
		fi
	done
fi
clear
showtasks
echo $status
}

#clear all tasks
clearall() {
read -p "This will erase all tasks! Do you want to proceed? [Y or N] " proceed
if [[ $proceed = "Y" || $proceed = "y" ]]; then
	opentasks=()
	closedtasks=()
	clear
	showtasks
	echo "Tasks were successfully erased!"
fi
}

#quit menu
quitscript(){

read -p "Do you want to save before quitting? [Y or N] " savequit
if [[ $savequit = "Y" || $savequit = "y" ]];then
	> ./texts/opentasks.txt
	> ./texts/closedtasks.txt
	for i in ${!opentasks[@]}; do echo ${opentasks[i]} >> ./texts/opentasks.txt; done
	for i in ${!closedtasks[@]}; do echo ${closedtasks[i]} >> ./texts/closedtasks.txt; done
	exit
elif [[ $savequit = "N" || $savequit = "n" ]];then
	read -p "Quit without saving? [Y or N] " justquit
	if [[ $justquit = "Y" || $justquit = "y" ]]; then
		exit
	fi
fi
}

#start
clear
showtasks

#menu
add="Add a new task"
remove="Remove a task"
close="Close a task"
clearall="Clear all tasks"

select option in "$add" "$remove" "$close" "$clearall" "Quit"; do
	case $option in
			$add) addnewtask;;
			$remove) removetask ;;
			$close) closetask ;;
			$clearall) clearall;;
			Quit) quitscript;;
	esac
done
