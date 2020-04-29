#!/bin/sh

PROJ_DIR="$(cd $(dirname $0) > /dev/null 2>&1 && pwd)";
BAKS_DIR=$PROJ_DIR/backups;
DB_NAME=wordpress
PUB_DIR=$PROJ_DIR/public
TIME=$(date +%m-%d-%Y_%H-%M-%S)
LATEST_TIMED_DIR=$BAKS_DIR/bucket/$TIME
LATEST_DIR=$BAKS_DIR/latest

LATEST_DB=$LATEST_TIMED_DIR/wordpress.sql.gz
LATEST_APP=$LATEST_TIMED_DIR/app.tar.gz

LN_LATEST_DB=$LATEST_DIR/wordpress.sql.gz
LN_LATEST_APP=$LATEST_DIR/app.tar.gz

RESTORE_DIR=$BAKS_DIR/restore


# Make your mysql local config, and update accordingly
# cp $PROJ_DIR/server/.my.cnf ~/.my.cnf

backup_now () {
  mkdir -p $LATEST_TIMED_DIR;
  # dump to timed dir
  mysqldump $DB_NAME | gzip -f -9 > $LATEST_DB;
  tar -zcf $LATEST_APP $PUB_DIR;
  # symlink to latest dir
  ln -sf $LATEST_DB $LN_LATEST_DB;
  ln -sf $LATEST_APP $LN_LATEST_APP;
}

backup_now;

create_restore_folder () {
  rm -rf $RESTORE_DIR/*;
  # zcat $LN_LATEST_DB | mysql $DB_NAME
  # dump sql instead
  zcat $LN_LATEST_DB > $RESTORE_DIR/wordpress.sql;
  # wp folder
  tar -xf $LN_LATEST_APP -C $RESTORE_DIR;
  mv $RESTORE_DIR$PUB_DIR $RESTORE_DIR/public;
  rm -rf $RESTORE_DIR/home;
}

create_restore_folder;
