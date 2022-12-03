#!/bin/sh

# Made by jumps-are-op
# This software is under GPL version 3 and comes with ABSOLUTELY NO WARRANTY

main(){
	priority=0
	while read -r rucksack;do
		part1=${rucksack%$(printf "%$((${#rucksack}/2))s" | tr ' ' '?')}
		part2=${rucksack#"${part1}"}

		while [ "$part1" ];do
			char=${part1%"${part1#?}"}
			echo "$part2" | grep "$char" -q && break
			part1=${part1#?}
		done

		charpriority=$(printf "%c" "$char" | od -d 2>/dev/null | head -n1)
		charpriority=${charpriority##* }

		case $char in
			[a-z])priority=$((priority+charpriority-96));;
			[A-Z])priority=$((priority+charpriority-38));;
		esac
	done <input.txt

	echo "$priority"
}

main "$@"
