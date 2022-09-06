#!/bin/bash

# book project
# prepare and convert md files to rst

cp -r linux-insides book
cp misc/cover.jpg book

cd book
rm -rf .git*
mv SUMMARY.md MAIN.md
rm -f Dockerfile 
rm -f CONTRIBUTING.md 
rm -f contributors.md 
#rm LICENSE.md 
rm -f README.md 

#sed -i -- 's/md)/rst)/g' *.md
sed -i -- 's/md)/rst)/g' MAIN.md

LISTE=$(find . -iname README.md)

for D in ${LISTE}; do
	echo ${D}
	VERZ=$(dirname ${D})
	NEUNAME=$(echo ${VERZ} | cut -d '/' -f 2)
	cd ${VERZ}
	sed -i -- 's/md)/rst)/g' README.md
	mv README.md ${NEUNAME}.md
	cd -
done

LISTE=$(find . -type f -name "*.md")
for D in ${LISTE}; do
	echo ${D}
	OLDN=$(basename ${D})
	NEUNAME=$(echo ${OLDN} | cut -d '.' -f 1)
	VERZ=$(dirname ${D})
	cd ${VERZ}
	pandoc --atx-headers --from markdown --wrap=none --toc --reference-links -s -t rst -o ${NEUNAME}.rst ${NEUNAME}.md
	rm ${NEUNAME}.md
	cd -
done
cd ..

