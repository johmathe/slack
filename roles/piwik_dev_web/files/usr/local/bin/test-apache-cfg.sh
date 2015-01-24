#!/bin/bash

function test_url () {
    if wget $1  -O - 2>/dev/null|grep -q "$2"; then
        return 0 
    else
        return 1
    fi
}

URL[1]="http://dev.piwik.org"
KEYWORD[1]="trac"
URL[2]="http://dev.piwik.org/svn/trunk/"
KEYWORD[2]="Revision"


for i in `seq 1 2`; do
  if test_url "${URL[$i]}" "${KEYWORD[$i]}"; then
    echo "${URL[$i]} : OK."
  else
    echo "${URL[$i]} : ERROR."
    echo "Keyword : ${KEYWORD[$i]}"
    exit 1
  fi
done

