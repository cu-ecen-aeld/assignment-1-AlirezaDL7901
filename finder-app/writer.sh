#!/bin/sh

set -e

if [ $# -lt 2 ]
	then
	if [ $# -lt 1 ]
		then
		echo "writefile and writestr not specified"
		exit 1
	else
		echo "writestr not specified"
		exit 1
	fi	
else
	writefile="$1"
	writestr="$2"
fi

writerFunc() {
    writepath="$(dirname $1)"
    mkdir -p $writepath
    echo $2 > $1

    if [ $? -ne 0 ]
    then
        echo "the file could not be created"
        exit 1
    fi
}

writerFunc	$writefile $writestr
