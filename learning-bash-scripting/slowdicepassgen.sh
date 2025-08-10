#Author Notes:
#For this task I tried to implement as many skills learned in the chapter as possible.
#Since there is a much faster way of doing the same thing, I also created the fast diceware
#pass phrase generator, that you can check in the file fastdicepassgen.sh
#
#Task Description
#Compose a script that uses control structure to react to input or other conditions.
#Examples include a quote viewer, a dice roll, or a card draw.
#Seat aside 20 minutes to build your script.
#
#Diceware passphrase generator
#Please, add as argument the number of desired pass phrases.

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
echo -e "The generated code is $yellow${codearr[@]}$normal, looking for the matching words..."
declare -a passarr
while read f; do
	number=$(echo "$f" | awk '{printf $1}')
	word=$(echo "$f" | awk '{printf $2}')
	for k in ${!codearr[@]}; do
		if [[ $number = ${codearr[k]} ]]; then
			passarr[k]=$word
		fi
	done
done < ./texts/wordlist.asc
echo -e "Your pass phrase is $yellow${passarr[@]}$normal"
