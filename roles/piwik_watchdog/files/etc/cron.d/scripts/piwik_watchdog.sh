#!/bin/bash

PIWIK_URL="http://stressme.piwik.org/piwik.php?url=http%3A%2F%2Fatdi.es%2F&action_name=&idsite=100&res=1680x1050&col=32&h=19&m=25&s=50&fla=1&dir=0&qt=1&realp=1&pdf=1&wma=0&java=1&cookie=1&title=ATDI%3A%3A%20software%20solutions%20in%20Radio%2FWeb%20communications%20-%20Welcome%20to%20the%20Frontpage&urlref="
TIMEOUT=1
PIWIK_PATH=/home/www/stressme.piwik.org/

if ! wget -t 3 --quiet --timeout=$TIMEOUT $PIWIK_URL -O - > /dev/null; then
  cp -pf $PIWIK_PATH/piwik.php $PIWIK_PATH/piwik.php.orig 
  cp -pf $PIWIK_PATH/piwik.php.degraded $PIWIK_PATH/piwik.php
  /etc/init.d/apache2 restart
  echo "piwik runs in degraded mode" 
fi

