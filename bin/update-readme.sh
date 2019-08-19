#!/bin/bash

us="`git config --local --get remote.origin.url`" || exit
# https://github.com/US/NA
# https://github.com/US/NA.git
# https://github.com/US/NA.git/
# git@github.com:US/NA
# git@github.com:US/NA.git
us="${us%/}"
# https://github.com/US/NA
# https://github.com/US/NA.git
# git@github.com:US/NA
# git@github.com:US/NA.git
na="${us##*/}"
# NA
# NA.git
na="${na%.git}"
# NA
us="${us%/*}"
# https://github.com/US
# https://github.com/US
# git@github.com:US
# git@github.com:US
us="${us##*[:/]}"
# US

BR=()
while read -ru6 sha br
do
	# SHA refs/heads/branch
	# SHA refs/heads/sub/branch
	br="${br#refs/heads/}"
	# branch
	# sub/branch
	case "$br" in
	(master)	continue;;
	# add more excludes here as shown with master
	esac
	BR+=("${br#refs/heads/}")
done 6< <(git ls-remote --heads origin)

# Poor man's replacer
for a
do
	# HEAD becomes Markdown branch list
	# Rest is taken from file
	{
	for br in "${BR[@]}"
	do
		echo "[![branch $br status](https://api.cirrus-ci.com/github/$us/$na.svg?branch=$br)](https://cirrus-ci.com/github/$us/$na/$br) ${br##*-},"
	done
	# Found no way to express the same in sed,
	# as sed apparently does not support inverted regexp
	# This removes the HEAD from the previous file:
	awk '!/^\[\!\[branch/,0' "$a"
	} > "$a.tmp" &&

	if	cmp -s "$a.tmp" "$a"
	then
		rm -f "$a.tmp"
	else
		mv -fv "$a.tmp" "$a"
	fi
done

