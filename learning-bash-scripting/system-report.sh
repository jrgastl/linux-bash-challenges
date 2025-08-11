# Author Notes: I spent more time in this exercise than what was suggested. The idea was to have as many skills demonstrated as possible.
# In the end still could have used variables for the formatting so I would repeat myself less. 
# I put some other examples of what was learned in this chapter of the course in the other-examples script.
#
# Task Description: Compose a script to show some system information.
#Use some standard tools, like df, free, or others.
#Use awk or sed to extract text from output, if you know them.
#Use formatted text.
#Set aside 20 minutes for this task.

#!/usr/bin/env bash

declare -i raw_storage_total=$(df | grep "/dev/sdd" | awk '{print $2}')
declare -i raw_storage_used=$(df | grep "/dev/sdd" | awk '{print $3}')
declare -i raw_storage_free=$(df | grep "/dev/sdd" | awk '{print $4}')
declare -i raw_memory_total=$(free | grep "Mem" | awk '{print $2}')
declare -i raw_memory_used=$(free | grep "Mem" | awk '{print $3}')
declare -i raw_memory_free=$(free | grep "Mem" | awk '{print $4}')
storage_total=$(echo "scale=1; $raw_storage_total / 1024 / 1024" | bc )
storage_used=$(echo "scale=1; $raw_storage_used / 1024 / 1024" | bc )
storage_free=$(echo "scale=1; $raw_storage_free / 1024 / 1024" | bc )
memory_total=$(echo "scale=1; $raw_memory_total / 1024 / 1024" | bc )
memory_used=$(echo "scale=1; $raw_memory_used / 1024 / 1024" | bc )
memory_free=$(echo "scale=1; $raw_memory_free / 1024 / 1024" | bc )
p_storage=$(echo "scale=1; $raw_storage_used * 100 / $raw_storage_total" | bc )
p_memory=$(echo "scale=1; $raw_memory_used * 100 / $raw_memory_total" | bc)

echo ""
echo -e "\033[35;46m         System Information          \033[0m"
echo -e "\033[35;46m------------------------------------ \033[0m"
echo -e "\033[35;46m        |  Total  |  Used  |  Free  |\033[0m"
printf "\033[35;46m%-8s|%8.1fG|%7.1fG|%7.1fG|\033[0m\n" "Storage" $storage_total $storage_used $storage_free "Memory" $memory_total $memory_used $memory_free
echo -e "\033[35;46m-------------------------------------\033[0m\n"
printf "\033[91;40;5mYou are using %.1f%% of the storage and %.1f%% of the  memory!\033[0m\n" $p_storage $p_memory
