#!/bin/bash

function test_url () {
    if wget $1  -O - 2>/dev/null|grep -q "$2"; then
        return 0 
    else
        return 1
    fi
}

URL[1]="http://piwik.org"
KEYWORD[1]="Homepage"
URL[2]="http://piwik.org/demo/"
KEYWORD[2]="Dashboard"
URL[3]="http://builds.piwik.org/"
KEYWORD[3]="LATEST"
URL[4]="http://piwik.org/__pma/"
KEYWORD[4]="Welcome to"
URL[6]="http://piwik.org/download/counter/"
KEYWORD[6]="Piwik has been downloaded:"
URL[7]="piwik.org/blog/piwik-open-source-web-analytics/"
KEYWORD[7]="Homepage"
URL[8]="http://piwik.org/feed/"
KEYWORD[8]="feedburner"
URL[9]="http://piwik.org/blog/feed/"
KEYWORD[9]="feedburner"


for i in `seq 1 9`; do
  if test_url "${URL[$i]}" "${KEYWORD[$i]}"; then
    echo "${URL[$i]} : OK."
  else
    echo "${URL[$i]} : ERROR."
    echo "Keyword : ${KEYWORD[$i]}"
    exit 1
  fi
done

