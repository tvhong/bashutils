#!/bin/bash

function do_rename() {
    fname=$1
    newname=$2
    if [ "$fname" != "$newname" ]; then
        mv "$fname" "$newname"
    fi
}

function get_lowercase_name() {
    echo "$1" | tr "[:upper:]" "[:lower:]"
}

# Rename the input filename to lowercase.
function low() {
    fname=$1
    newname=$(get_lowercase_name "$fname")
    do_rename "$fname" "$newname"
}

# Rename all files in current directory to lowercase.
function lowdir() {
    for fname in *
    do
        low "$fname"
    done
}

function get_name_with_underscore() {
    # replace unwanted chars with "_", then replace continuous "_"
    echo "$1" | sed "s/[ -]/_/g" | sed "s/_\+/_/g"
}

# Replace " " & "-" with "_".
function under() {
    fname=$1
    newname=$(get_name_with_underscore $fname)
    do_rename "$fname" "$newname"
}

# do under() for all files in current directory
function underdir() {
    for fname in *
    do
        under "$fname"
    done
}

# Rename a single file.
function rfile() {
    fname=$1
    newname=$(get_name_with_underscore "$fname")
    newname=$(get_lowercase_name "$newname")
    do_rename "$fname" "$newname"
}

# Rename dir.
function rdir() {
    for fname in *
    do
        rfile "$fname"
    done
}
