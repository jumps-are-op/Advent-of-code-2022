#!/bin/sh

# Made by jumps-are-op
# This software is under GPL version 3 and comes with ABSOLUTELY NO WARRANTY

main(){
	totalcals=0
	largestcals=0

	while read -r cals;do
		if [ ! "$cals" ];then
			[ "$totalcals" -gt "$largestcals" ] && largestcals=$totalcals
			totalcals=0
		else
			totalcals=$((totalcals+cals))
		fi
	done <part1_input.txt

	[ "$totalcals" -gt "$largestcals" ] && largestcals=$totalcals
	echo "$largestcals"
}

main "$@"
