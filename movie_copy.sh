#!/usr/bin/env bash

udisksctl mount -b /dev/sdd1 && rsync -aP ~/movies/  /run/media/himanshu/Transcend/movies/ 
udisksctl unmount -b /dev/sdd1

