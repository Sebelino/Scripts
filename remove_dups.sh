#!/usr/bin/zsh

# For each "BASENAME.pdf" in a specified directory, remove all "BASENAME \(\d+\).pdf".

DIR=$1

ALLFILES=$(for f in ~/Downloads/*; echo $f)
BASEFILENAMES=$(for f in ~/Downloads/*; echo ${f%.*} | egrep -v '\([0-9]+\)$')

echo $BASEFILENAMES | while read f; do
    DUPS=$(echo $ALLFILES | grep $f | egrep " \([0-9]+\).*$")
    if [[ -n $DUPS ]]; then
        echo $DUPS | while read d; do
            echo rm $d
            rm $d
        done
    fi
done
