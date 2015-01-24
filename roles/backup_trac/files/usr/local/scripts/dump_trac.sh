#!/bin/bash -e

TRAC_PATH=`date +%Y%m%d`
mkdir -p /home/backups/trac-backups/$TRAC_PATH
cd /home/backups/trac-backups/$TRAC_PATH
trac-admin /home/www/trac wiki dump

