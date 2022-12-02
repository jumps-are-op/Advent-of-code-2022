#!/bin/sh

# Made by jumps-are-op
# This software is under GPL version 3 and comes with ABSOLUTELY NO WARRANTY

main(){
	totalcals=0
	largestcals1=0
	largestcals2=0
	largestcals3=0

	while read -r cals;do
		if [ ! "$cals" ];then
			if [ "$totalcals" -gt "$largestcals1" ];then
				largestcals3=$largestcals2
				largestcals2=$largestcals1
				largestcals1=$totalcals

			elif [ "$totalcals" -gt "$largestcals2" ];then
				largestcals3=$largestcals2
				largestcals2=$totalcals

			elif [ "$totalcals" -gt "$largestcals3" ];then
				largestcals3=$totalcals

			fi
			totalcals=0
			continue
		fi
		totalcals=$((totalcals+cals))
	done <input.txt

	if [ "$totalcals" -gt "$largestcals1" ];then
		largestcals1=$totalcals
		largestcals3=$largestcals2
		largestcals2=$largestcals1

	elif [ "$totalcals" -gt "$largestcals2" ];then
		largestcals3=$largestcals2
		largestcals2=$totalcals

	elif [ "$totalcals" -gt "$largestcals3" ];then
		largestcals3=$totalcals

	fi

	echo "$((largestcals1+largestcals2+largestcals3))"
}

main "$@"
