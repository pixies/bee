#!/bin/bash
#script para criar a config do awstats

#variaveis
DIR_VHOST=/etc/httpd/vhosts/
DIR_AW=/etc/awstats/
MODELO=/aletta/services/modelo.conf
TMP=/tmp/criaaw/
LISTA=$TMP/lista.tmp

#criar lista dos vhosts
mkdir $TMP
ls $DIR_VHOST | sed "s/.vhosts//g" > $LISTA

#numero de vhosts
NUM=$(wc -l $LISTA | cut -b 1-3)

i=1
while [  $i -le $NUM ]; do
	VHOST=$(head -n $i $LISTA | tail -n 1)
	cat $MODELO | sed "s/VHOST/$VHOST/g" > $TMP/awstats.$VHOST.conf
	let i=$i+1
done

rm $LISTA ; rm $TMP/*~* ; cp $TMP/* $DIR_AW ; rm -rf $TMP
