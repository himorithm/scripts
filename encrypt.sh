#!/usr/bin/env sh
for i in *.md
do
    [ -f "$i" ] && echo $i || { echo "No File Exist"; exit 1; }
    gpg --encrypt --sign --recipient Himanshu $i && rm -i $i
    chmod 400 $i.gpg
done
