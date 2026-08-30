#!/bin/sh

set -e

if [ $# -lt 2 ]
	then
	if [ $# -lt 1 ]
		then
		echo "filesdir and searchstr not specified"
		exit 1
	else
		echo "searchstr not specified"
		exit 1
	fi	
else
	filesdir="$1"
	searchstr="$2"
fi

finderFunc() {
	X=$(find $1 -type f | wc -l)
	Y=$(grep -r $2 $1 | wc -l)
	echo "The number of files are ${X} and the number of matching lines are ${Y}"
}


if [ -d $filesdir ]
	then
	finderFunc	$filesdir $searchstr
else
	echo "\"${filesdir}\" does not represent a directory on the filesystem"
	exit 1
fi
