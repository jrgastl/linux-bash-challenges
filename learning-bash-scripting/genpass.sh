#Task Description
#Compose a script that uses control structure to react to input or other conditions.
#Examples include a quote viewer, a dice roll, or a card draw.
#Seat aside 20 minutes to build your script.
#
#My attempt: diceware passphrase generator
declare -a codearr
for i in $(seq 1 $1); do
	declare code=""
	for j in {1..5}; do
		code+=$((1 +  RANDOM % 6 ))
		done
	codearr+=($code)
	done
declare -a passarr
for k in ${codearr[@]}; do
	while read f; do 
		if [[ $(echo "$f" | awk '{printf $1}') = $k ]]; then
			passarr+=($(echo "$f" | awk '{printf $2}'))
		echo $passarr
		fi
	done < ./text/wordlist2.asc
done
echo ${passarr[@]}
