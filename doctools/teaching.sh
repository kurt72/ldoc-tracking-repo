#!/bin/bash

# teaching project
# prepare rst files to import in kenrel doc folder

VERZ=linux-kernel-labs/Documentation

mkdir -p KDOC/sphinx
mkdir -p KDOC/sphinx-static

cp -r ${VERZ}/teaching KDOC
cp -r ${VERZ}/media KDOC

cp ${VERZ}/sphinx/asciicast.py  KDOC/sphinx
cp ${VERZ}/sphinx/ditaa.py  KDOC/sphinx
cp ${VERZ}/sphinx-static/asciinema-player.* KDOC/sphinx-static


