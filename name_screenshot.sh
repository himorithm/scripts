#!/usr/bin/env bash
echo -n "ScreenshotName:"
read name
outname="$name.png"
grim -g "$(slurp)" $outname
echo $(pwd)"/"$outname
