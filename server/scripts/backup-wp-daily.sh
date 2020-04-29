#!/bin/sh

PARENT="/home/forge/sites/cloudways.paoloumali.com/public/wp-content/pu-backups"

mysqldump -u forge -p wordpress | gzip -f -9 > $PARENT/wordpress.sql.gz

# restore
# zcat $PARENT/wordpress.sql.gz | mysql -u forge -p wordpress
