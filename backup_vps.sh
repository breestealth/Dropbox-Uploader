#!/bin/bash
BACKUP_SRC="" # Input the Dirs your want to backup, use space to input more than one dir
BACKUP_DST="/tmp" #Where your want to store your backup
MYSQL_SERVER="localhost"
MYSQL_USER=""
MYSQL_PASSWORD=""
MYSQL_DATABASES="wordpress drupal"


NOW=$(date +"%Y.%m.%d")
DESTFILE="$BACKUP_DST/$NOW.tgz"


mysqldump -u $MYSQL_USER -h $MYSQL_SERVER -p$MYSQL_PASSWORD -databases $MYSQL_DATABASES > "$NOW-Databases.sql"

tar czf $DESTFILE $BACKUP_SRC $NOW-Databases.sql

sh ./dropbox_uploader.sh upload $DESTFILE

rm -f $DESTFILE $NOW-Databases.sql
