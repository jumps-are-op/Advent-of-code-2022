#!/bin/sh

# Made by jumps-are-op
# This software is under GPL version 3 and comes with ABSOLUTELY NO WARRANTY

main(){
	read -r input <input.txt
	n=4

	while :;do
		# Check for dups
		check=${input%"${input#????}"}

		if [ "$(echo "$check" | grep -o . | sort -u | wc -l)" = 4 ];then
			echo "$n"
			break
		fi

		n=$((n+1))
		input=${input#?}
	done
}

main "$@"
