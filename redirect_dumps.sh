#!/bin/bash
# Copies the par dumps that arrive in one destination to another

display_usage() { 
	echo "This script copys files of type Dump-0000.rec to new destination" 
	echo -e "\nUsage:\n$0 [par/rec dump folder] [destination] [# of TRs to be collected]\n" 
	} 
# if less than two arguments supplied, display usage 
if [  $# -le 2 ] 
then 
	display_usage
	exit 1
fi 

basename="Dump-"
dumps="${1%/}" # arrival dir
dest="$2" # destination dir
TR="3" # number of TRs to be dumped

if [[ ! -e $dest ]]; then
    mkdir $dest
elif [[ ! -d $dest ]]; then
    echo "$dest already exists but is not a directory" 1>&2
fi

for ((i=0;i<=$TR;i++)); do
# while [ $i -lt $total ] ; do

	number=$(printf "%04d" $i)
	filename="$dumps/${basename}${number}.rec"

	while [ ! -f "${filename}" ] ; do
		sleep 0.1
	done

	cp "${filename}" "$dest"

done