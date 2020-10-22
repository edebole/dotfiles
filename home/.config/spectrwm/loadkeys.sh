#!/bin/bash
get_keys=`setxkbmap -v | grep symbols | cut -d "+" -f2`

invert() {
    if [ "$get_keys" == "us"  ]
    then
        lang="es"
        `setxkbmap -layout es`
    else
        lang="us"
        `setxkbmap -layout us`
    fi
    echo -e "$lang"
}

echo $(invert)

