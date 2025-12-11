#!/bin/sh

packages=$(ls -l | grep drwxr | awk "{print \$9}")
count=$(wc -l <<< "$packages")
updated=0

for package in $packages
do
    aurpublish $package
    ((updated++))
    echo -e "\e[32m  >>> Pushed $updated out of $count packages.\e[0m"
done

