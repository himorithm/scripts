#!/usr/bin/env sh
tac ~/.surf/history | dmenu -l 10 | cut -d ' ' -f 3
