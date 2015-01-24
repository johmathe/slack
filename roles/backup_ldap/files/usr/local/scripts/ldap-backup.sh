#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
source /etc/backup-files.conf
date +%Y%m%d >> "$LDAP_BACKUPS"
slapcat >> "$LDAP_BACKUPS"
