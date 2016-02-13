#!/bin/sh


for i in $( ls ); do
    cat $i | grep "$1"

done
