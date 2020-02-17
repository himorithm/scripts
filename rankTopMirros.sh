#!/usr/bin/bash
echo "Uncommeting mirrorlist.backup"
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup 
echo "Ranking top 20"
/usr/bin/rankmirrors -n 20 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
echo "All Done"
