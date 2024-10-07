#!/usr/bin/env bash

echo "NORMINETTE ERRORS"
norminette get_next_line.c | awk '!/OK!$/'
norminette get_next_line_utils.c | awk '!/OK!$/'
norminette get_next_line.h | awk '!/OK!$/'
printf "%s " "BONUS? [y/N]"
read bonus
printf "%s " "BUFFSIZE? Number or [n]"
read buff
if [ "$buff" = "n" ]; then
BUFF=""
else
BUFF="-D BUFFER_SIZE="$buff
fi
if [ "$bonus" = "y" ]; then
cc -Wall -Wextra -Werror get_next_line_bonus.c get_next_line_utils.c get_next_line.h test.c -ggdb -L. -lft $BUFF
else
cc -Wall -Wextra -Werror get_next_line.c get_next_line_utils.c get_next_line.h test.c -ggdb -L. -lft $BUFF
fi
# if there are no arguments
printf "%s " "Press any key to continue"
read ans
clear
if [ $# -eq 0 ]; then
# run tests with all files
./a.out $(ls *.txt)
else
arr=()
for var in $@
do
arr+=($(echo $var | awk '!/\.txt$/ {print $0".txt"} /\.txt$/ {print $0}'))
done
./a.out "${arr[@]}"
fi
read ans
printf "%s " "AKIRA? [y/N]"
read akira
if [ "$akira" = "y" ]; then
cc get_next_line_bonus.c get_next_line_utils.c get_next_line.h animation_main.c -g -L. -lft
zsh -c "./a.out akira/akirav1.txt 16"
fi