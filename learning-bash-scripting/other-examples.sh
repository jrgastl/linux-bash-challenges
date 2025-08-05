#!/usr/bin/env bash

#Brace expansion
echo ""
echo "Brace Expansion Example"
echo {test,this,text}_{1..3}

#Parameter expansion and variables
echo "" 
echo "Parameter Expansion and Variables Example"
declare -u a="Joao"
echo -e "Replace this name "$a"...\n...by this name "${a/JOAO/Ricardo}""

#Arithmetic expansion and evaluation
echo ""
echo "Arithmetic Expansion and Evaluation Examples"
declare -i mynum=48
echo "The value of the variable mynum is $mynum"
(( mynum+=2 ))
echo "Mynum incremented by 2 is $mynum"
echo "Mynum times 3 divided by 5 is $(( (mynum * 3) / 5 ))" 
echo "bc can help us to deal with decimals, like in 100 divided by 3 that is equal to $(echo "scale=3; 100/3" | bc)" 
echo "RANDOM can be used to give us a random number between 1 and 10 : $((1 + RANDOM % 10))"

#Extended test
echo "" 
echo "Extended Test Example"
echo "Is /home a directory?"
echo $([[ -d /home ]] && echo /home is a directory)
echo "Is /home or /house a directory?"
echo $([[ -d /home || -d /house ]] && echo "yes, one of them is a directory") 
echo "Are both /home and /house directories?"
echo $([[ -d /home && -d /house ]]; echo $?)

#Arrays
declare -a car_brands=(ferrari porsche maseratti)
echo ${car_brands[1]}
car_brands[5]=lamborghini
echo ${car_brands[5]}
for i in {0..5};do echo $i: ${car_brands[i]}; done 
declare -A vm
vm["name"]="main"
vm["cpu"]=4
vm["gpu"]="nvidia"
vm["disk"]=100

echo "The Virual Machine has ${vm["cpu"]} cores and a ${vm["gpu"]} gpu"
