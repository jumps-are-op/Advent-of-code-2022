#!/bin/sh

# Made by jumps-are-op
# This software is under GPL version 3 and comes with ABSOLUTELY NO WARRANTY

main(){
	set -e
	conflict=0

	while IFS=,- read -r a b c d;do
		if [ "$a" -ge "$c" ] && [ "$b" -le "$d" ];then
			conflict=$((conflict+1))
		elif [ "$c" -ge "$a" ] && [ "$d" -le "$b" ];then
			conflict=$((conflict+1))
		fi
	done <input.txt

	echo "$conflict"
}

main "$@"
