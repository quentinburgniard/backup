#!/bin/bash
FILE=api-$(date -I)
echo $FILE
echo $MYSQL_USER

mariadb-dump --compact -h db -p$MYSQL_PASSWORD -u $MYSQL_USER api > /tmp/$FILE.sql

DATE=$(date +"%a, %d %b %Y %T %z")
STRING="PUT\n\ntext/plain\n$DATE\nx-amz-acl:private\nx-amz-storage-class:STANDARD\n/digitalleman/backup/$FILE.sql"
SIGNATURE=$(echo -en "$STRING" | openssl sha1 -hmac "$DIGITALOCEAN_PASSWORD" -binary | base64)
curl -X PUT -T "/tmp/$FILE.sql"\
  -H "authorization: AWS $DIGITALOCEAN_USER:$SIGNATURE" \
  -H "content-type: text/plain" \
  -H "date: $DATE" \
  -H "host: digitalleman.fra1.digitaloceanspaces.com" \
  -H "x-amz-acl:private" \
  -H "x-amz-storage-class:STANDARD" \
  "https://digitalleman.fra1.digitaloceanspaces.com/backup/$FILE.sql"
rm /tmp/$FILE.sql