#!/bin/sh

packages=$(ls -l | grep drwxr | awk "{print \$9}")
count=$(wc -l <<< "$packages")
cleaned=0

for package in $packages
do
    cd "$package"
    rm -rf src pkg *.pkg.tar.zst "${package%-git}"
    cd ..
    ((cleaned++))
    echo -e "\e[32m  >>> Cleaned $package, $cleaned out of $count packages.\e[0m"
done
