#!/bin/bash
#Variaveis
DIR_VHOST=/home/kr4m3r/vhosts
DIR_NOVOS=/home/kr4m3r/vhosts.novos

#execu
mkdir $DIR_NOVOS
for i in `ls $DIR_VHOST` ; do
	cd $DIR_VHOST
	sed "s/commom/combined/g" $i >> $DIR_NOVOS/$i
done
rm -rf $DIR_VHOST 
mv $DIR_NOVOS $DIR_VHOST
