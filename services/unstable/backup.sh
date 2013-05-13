#!/bin/bash

###################################################
###################################################
## Script para realizar backups compactados de
## vhosts no formato DATA_ATUAL-vhost.tar.gz
## 
###################################################
###################################################

# recuperar data atual para
# incrementar backup
DATA=`date +%d_%m_%Y`

#pasta onde encontram-se os vhosts
DIR="/tagi/sitios"

#particao onde serao gravados os backups
#DEV_BKP="/dev/hda5"

#pasta onde sera montado DEV_BKP
MNT_BKP="/tagi/backups"
#pasta onde os backups serao armazenados
DIR_BKP="/tagi/backups/bkp-$DATA"

#montar parciao de backup
#mount $DEV_BKP $MNT_BKP
#criar a pasta de backup com a data
mkdir -p $DIR_BKP


       for i in `ls $DIR`; do
        cd $DIR_BKP
        tar -cvzf $DATA-$i.tar.gz $DIR/$i
        done

exit

umount $MNT_BKP
exit

