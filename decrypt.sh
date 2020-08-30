#!/usr/bin/env sh
for i in *.gpg
do
    [ ! -f "$i" ] && echo "No File exist" && exit 1
    output=$(echo $i | sed 's/.gpg//g')
    gpg --decrypt $i > $output && rm -i $i
    chmod 600 $output
done
