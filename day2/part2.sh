#!/bin/sh

# Made by jumps-are-op
# This software is under GPL version 3 and comes with ABSOLUTELY NO WARRANTY

main(){
	score=0
	while read -r a b;do
		case $a$b in
			AX)score=$((score+3));;
			AY)score=$((score+4));;
			AZ)score=$((score+8));;
			BX)score=$((score+1));;
			BY)score=$((score+5));;
			BZ)score=$((score+9));;
			CX)score=$((score+2));;
			CY)score=$((score+6));;
			CZ)score=$((score+7));;
		esac
	done <input.txt
	echo "$score"
}

main "$@"
