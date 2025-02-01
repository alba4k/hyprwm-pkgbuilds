#!/bin/sh

packages=$(ls -l | grep drwxr | awk "{print \$9}")
count=$(wc -l <<< "$packages")
updated=0

for package in $packages
do
    aurpublish -p $package
    ((updated++))
    echo -e "\e[32m  >>> Pulled $updated out of $count packages.\e[0m"
done
