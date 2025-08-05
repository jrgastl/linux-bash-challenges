#!/usr/bin/env bash

yellow="\033[33m"
normal="\033[0m"
blue="\033[34m"

#Brace expansion - an example on how to optimize a command by using the brace expansion.
echo ""
echo -e "$yellow"Brace Expansion Example$normal""
echo {test,this,text}_{1..3}

#Parameter expansion and variables - some examples on how to deal with variables and parameters.
echo "" 
echo -e "$yellow"Parameter Expansion and Variables Example$normal""
declare -u a="Joao"
echo -e "Replace this name "$a"...\n...by this name "${a/JOAO/Ricardo}""

#Arithmetic expansion and evaluation - some examples on how to do arithmetic operations.
echo ""
echo -e "$yellow"Arithmetic Expansion and Evaluation Examples$normal""
declare -i mynum=48
echo "The value of the variable mynum is $mynum"
(( mynum+=2 ))
echo "Mynum incremented by 2 is $mynum"
echo "Mynum times 3 divided by 5 is $(( (mynum * 3) / 5 ))" 
echo "bc can help us to deal with decimals, like in 100 divided by 3 that is equal to $(echo "scale=3; 100/3" | bc)" 
echo "RANDOM can be used to give us a random number between 1 and 10 : $((1 + RANDOM % 10))"

#Extended test - some examples of comparisons that can be made, including to create conditions.
echo "" 
echo -e "$yellow"Extended Test Example$normal""
echo "Is /home a directory?"
echo $([[ -d /home ]] && echo /home is a directory)
echo "Is /home or /house a directory?"
echo $([[ -d /home || -d /house ]] && echo "yes, one of them is a directory") 
echo "Are both /home and /house directories?"
echo $([[ -d /home && -d /house ]]; echo $?)

#Arrays - some examples on how to do arrays
echo ""
echo -e "$yellow"Indexed array example$normal""
declare -a car_brands=("ferrari" "porsche" "maseratti")
echo -e "$blue${car_brands[1]}$normal is the second item in the array"
car_brands[5]="lamborghini"
car_brands+=("aston martin")
echo -e "$blue${car_brands[5]}$normal is the sixth item in the array"
echo -e "$blue${car_brands[@]}$normal are all items in the array"
echo -e "$blue${car_brands[@]: -1}$normal is last item in the array"
for i in {0..6};do echo $i: ${car_brands[i]}; done 
echo ""
echo -e "$yellow"Associative array example$normal""
declare -A vm
vm["name"]="main"
vm["cpu"]=4
vm["gpu"]="nvidia"
vm["disk"]=100

echo -e "$blue${vm["name"]}$normal is the value of the "name" key in the vm array"
echo -e "$blue${vm["cpu"]}$normal is the value of the "cpu" key in the vm array"
echo -e "$blue${vm["gpu"]}$normal is the value of the "gpu" key in the vm array"
echo -e "$blue${vm["disk"]}$normal is the value of the "disk" key in the vm array"

echo "The Virual Machine has ${vm["cpu"]} cores and a ${vm["gpu"]} gpu"
