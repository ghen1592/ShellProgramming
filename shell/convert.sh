#!/bin/bash

export LANG=en_US.UTF-8

#if [ $# -ne 2 ] ; then
#	echo "Usage: $0 <Inputfile> <outputfile>"
#	exit 1
#fi

InputFile=/share/output.txt     # InputFile=$1
OutputFile=/share/output.csv    # OutputFile=$2
> $OutputFile

cat $InputFile | while read ID NAME EMAIL PHONE ADDR
do
        echo "$ID,$NAME,$EMAIL,$PHONE,$ADDR" >> $OutputFile
done