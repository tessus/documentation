#!/bin/bash

IN=$1
F=${IN%.*}
TEX=${F}.tex
OUT=${F}_info.tex

echo "\newif\ifdata" >${OUT}

COMMIT_HASH=`git log -1 --pretty=%H ${TEX}`

if [ "$?" == "0" ]
then
	COMMIT_HASH_ABBREV=`git log -1 --pretty=%h ${TEX}`
	COMMIT_DATETIMETZ=`git log -1 --pretty=%ai ${TEX}`
	COMMIT_DATE=`git log -1 --pretty=%ai ${TEX} |cut -c1-10`
	COMMIT_TIME=`git log -1 --pretty=%ai ${TEX} |cut -c12-19`
	COMMIT_TZ=`git log -1 --pretty=%ai ${TEX} |cut -c21-25`
	COMMIT_DATETIME="${COMMIT_DATE} ${COMMIT_TIME}"
	CY=`echo ${COMMIT_DATE} |cut -c1-4`
	CM=`echo ${COMMIT_DATE} |cut -c6-7`
	CD=`echo ${COMMIT_DATE} |cut -c9-10`
		
	echo "\datatrue" >>${OUT}
	echo "\newcommand{\CommitHash}{${COMMIT_HASH}}" >>${OUT}
	echo "\newcommand{\CommitHashAbbrev}{${COMMIT_HASH_ABBREV}}" >>${OUT}
	echo "\newcommand{\CommitDateTimeTz}{${COMMIT_DATETIMETZ}}" >>${OUT}
	echo "\newcommand{\CommitDateTime}{${COMMIT_DATETIME}}" >>${OUT}	
	echo "\newcommand{\CommitDate}{${COMMIT_DATE}}" >>${OUT}
	echo "\newcommand{\CommitTime}{${COMMIT_TIME}}" >>${OUT}
	echo "\newcommand{\CommitTz}{${COMMIT_TZ}}" >>${OUT}
	echo "\newcommand{\CommitY}{${CY}}" >>${OUT}
	echo "\newcommand{\CommitM}{${CM}}" >>${OUT}
	echo "\newcommand{\CommitD}{${CD}}" >>${OUT}
else
	echo "\datafalse" >>${OUT}
	echo "\newcommand{\CommitHash}{}" >>${OUT}
	echo "\newcommand{\CommitHashAbbrev}{}" >>${OUT}
	echo "\newcommand{\CommitDateTimeTz}{}" >>${OUT}
	echo "\newcommand{\CommitDateTime}{}" >>${OUT}
	echo "\newcommand{\CommitDate}{}" >>${OUT}
	echo "\newcommand{\CommitTime}{}" >>${OUT}
	echo "\newcommand{\CommitTz}{}" >>${OUT}
	echo "\newcommand{\CommitY}{}" >>${OUT}
	echo "\newcommand{\CommitM}{}" >>${OUT}
	echo "\newcommand{\CommitD}{}" >>${OUT}
fi	
