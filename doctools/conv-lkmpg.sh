#!/bin/bash

# doc project
# convert tex files to html to rst

cp -r lkmpg lkmpg-rst
cd lkmpg-rst

make html
pandoc lkmpg-for-ht.html --to rst -o lkmpg.rst

rm contrib.tex html.cfg lkmpg.tex Makefile README.md
cd ..

