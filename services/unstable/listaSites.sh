#!/bin/bash
echo "digite o diretorio a ser verificado o tamanho..."
echo "Ex. /aletta/sitios"
read DIR
#diretorios

for i in `ls $DIR`; do
	du -csh $DIR/$i |egrep -v "total|^$"
done
exit
