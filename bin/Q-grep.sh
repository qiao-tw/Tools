#!/bin/bash

echo "You are launching \" grep -rns --dxclude-dir=\".svn\" <\$1> <\$2>\""

read -e -p "1st param: " iKeyword
read -e -p "2nd param: " iPath

grep -rns --color --exclude-dir=".svn" $iKeyword $iPath

