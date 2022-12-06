#!/bin/sh

# Made by jumps-are-op
# This software is under GPL version 3 and comes with ABSOLUTELY NO WARRANTY

main(){
	while IFS= read -r stacks;do
		for i in 1 2 3 4 5 6 7 8 9;do
			[ "${stacks%"${stacks#?}"}" != " " ] &&
				pushto stack_"$i" "${stacks%"${stacks#?}"}"
			stacks=${stacks#? }
		done
	done <<-EOF
		$(printf "1,8g/^/m0\n1,8p\nQ\n" | ed -s input.txt |
			tr -d '[]' | sed 's/    /  /g')
	EOF

	while read -r _ n _ from _ to;do
		pushto "stack_$to" "$(popfrom "stack_$from" "$n")"
		popfrom "stack_$from" "$n" >/dev/null
	done <<-EOF
		$(tail -n +11 input.txt)
	EOF

	for i in 1 2 3 4 5 6 7 8 9;do
		eval "echo \$stack_$i"
	done
}

# Push $2 to $1 stack
pushto(){
	eval "$1=\$$1'$2'"
}

# Pop from $1 stack $2 items
popfrom(){
	eval "echo \"\${$1#\"\${$1%$(printf "%$2s" | tr ' ' '?')}\"}\""
	eval "$1=\${$1%$(printf "%$2s" | tr ' ' '?')}"
}

main "$@"
