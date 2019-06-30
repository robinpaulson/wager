#!/bin/sh

# script to split single sql file into several
# takes the output of sqlitestudio

# TODO: trim the first 5 lines programmatically - at present this must be done manually
# TODO: use -b and -f flags to change prefix and suffix.

csplit wager.sql '/-- Table:/' '{*}'

# xx00 is empty, so delete it
rm xx00
for file in xx*
do
	filename=`cat $file|grep Table| cut -b 11-40`
	echo $filename
	mv $file $filename".sql"
done
