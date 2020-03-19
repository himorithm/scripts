#!/usr/bin/bash
echo "Uncommeting mirrorlist.backup"
rm -f /etc/pacman.d/mirrorlist.tmp
cp /etc/pacman.d/mirrorlist.org /etc/pacman.d/mirrorlist.tmp
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.tmp 
echo "Ranking top 100"
/usr/bin/rankmirrors -n 100 /etc/pacman.d/mirrorlist.tmp > /etc/pacman.d/mirrorlist
echo "All Done"
