#!/bin/bash

# Rename the input filename to lowercase.
function low() {
    fname=$1
    newname=$(echo "$fname" | tr "[:upper:]" "[:lower:]")
    if [ "$fname" != "$newname" ]; then
        mv "$fname" "$newname"
    fi
}

# Rename all files in current directory to lowercase.
function lowdir() {
    for fname in *
    do
        low "$fname"
    done
}

# Replace " " & "-" with "_".
function under() {
    fname=$1
    # replace unwanted chars with "_", then replace continuous "_"
    newname=$(echo "$fname" | sed "s/[ -]/_/g" | sed "s/_\+/_/g")
    if [ "$fname" != "$newname" ]; then
        mv "$fname" "$newname"
    fi
}

# do under() for all files in current directory
function underdir() {
    for fname in *
    do
        under "$fname"
    done
}

# Rename dir.
function redir() {
    underdir
    lowdir
}
