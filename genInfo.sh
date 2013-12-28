#!/bin/bash

IN=$1
F=${IN%.*}
TEX=${F}.tex
OUT=${F}_info.tex

if [ -f $OUT ]
then
	rm -f $OUT
	touch $OUT
fi

COMMIT_HASH=`git log -1 --pretty=%H ${TEX}`

if [ "$?" == "0" ]
then
	COMMIT_HASH_ABBREV=`git log -1 --pretty=%h ${TEX}`
	COMMIT_DATE=`git log -1 --pretty=%ci ${TEX} |cut -c1-19`
	CY=`echo ${COMMIT_DATE} |cut -c1-4`
	CM=`echo ${COMMIT_DATE} |cut -c6-7`
	CD=`echo ${COMMIT_DATE} |cut -c9-10`
	echo "\newcommand{\CommitHash}{Id: ${COMMIT_HASH}}" >>${OUT}
	echo "\newcommand{\CommitHashAbbrev}{Id: ${COMMIT_HASH_ABBREV}}" >>${OUT}
	echo "\newcommand{\CommitDate}{Date: ${COMMIT_DATE}}" >>${OUT}
	echo "\newcommand{\CommitY}{${CY}}" >>${OUT}
	echo "\newcommand{\CommitM}{${CM}}" >>${OUT}
	echo "\newcommand{\CommitD}{${CD}}" >>${OUT}
else
	echo "\newcommand{\CommitHash}{}" >>${OUT}
	echo "\newcommand{\CommitHashAbbrev}{}" >>${OUT}
	echo "\newcommand{\CommitDate}{}" >>${OUT}
	echo "\newcommand{\CommitY}{}" >>${OUT}
	echo "\newcommand{\CommitM}{}" >>${OUT}
	echo "\newcommand{\CommitD}{}" >>${OUT}
fi	
