#!/bin/bash -e

TOKEN_AUTH="957ece84f7844a2483f5fa332940e881"
PHP_BIN=/usr/bin/php5
PIWIK_PATH=/home/www/piwik/demo/index.php

for period in day week year; do
  CMD="$PHP_BIN $PIWIK_PATH -- module=API&method=VisitsSummary.getVisits&idSite=all&period=$period&date=last52&format=xml&token_auth=$TOKEN_AUTH";
  $CMD
  echo ""
done

