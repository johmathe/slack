#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
source /etc/backup-files.conf
date +%Y%m%d >> "$MYSQL_BACKUP"
mysqldump --defaults-file=/etc/mysql/debian.cnf --all-databases >> "$MYSQL_BACKUP"
