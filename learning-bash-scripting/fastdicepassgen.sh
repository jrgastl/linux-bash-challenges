#To execute this script, please add the number of pass phrases you want as an argument.

#!/usr/bin/env bash


yellow="\033[33m"
normal="\033[0m"

declare -a codearr
for i in $(seq 1 $1); do
	declare code=""
	for j in {1..5}; do
		code+=$((1 +  RANDOM % 6 ))
		done
	codearr+=($code)
	done
declare -a passarr
	number=$(echo "$f" | awk '{printf $1}')
	word=$(echo "$f" | awk '{printf $2}')
for k in ${!codearr[@]}; do
	word=$(grep ${codearr[k]} ./text/wordlist.asc | awk '{printf $2}')
	passarr[k]=$word
done 
echo -e  "Your pass phrase is: $yellow${passarr[@]}$normal"
