#!/bin/sh

# Made by jumps-are-op
# This software is under GPL version 3 and comes with ABSOLUTELY NO WARRANTY

main(){
	priority=0

	while read -r rucksack1 rucksack2 rucksack3;do
		while [ "$rucksack1" ];do
			char=${rucksack1%"${rucksack1#?}"}
			check=$(printf "%s\n%s" "$rucksack2" "$rucksack3" | grep -c "$char")
			[ "$check" = 2 ] && break
			rucksack1=${rucksack1#?}
		done

		charpriority=$(printf "%c" "$char" | od -d 2>/dev/null | head -n1)
		charpriority=${charpriority##* }

		case $char in
			[a-z])priority=$((priority+charpriority-96));;
			[A-Z])priority=$((priority+charpriority-38));;
		esac
	done <<-EOF
		$(tr '\n' ' ' <input.txt | sed 's/\(\S* \S* \S*\) /\1\n/g')
	EOF

	echo "$priority"
}

main "$@"
