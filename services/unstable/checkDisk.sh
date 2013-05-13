#!/bin/bash

#Comando que retorna somente o valor ocupado
#do disco.
#DISK=`df -h |grep -i aletta | cut -d' ' -f22 | sed 's/%//g'`
DISK=`df |grep '/dev/md2' |awk '{print $5}' |sed 's/%//g'`

#Valor limite
VALOR_MAX="85"
#retorna a hora da aletta
DATE=`date +%d/%m/%Y_%H:%M`
#emails de quem recebera o alerta
EMAILS="pixies@pelivre.org"


#execucao do script
if (($DISK > $VALOR_MAX))
then
echo "Atualmente ocupando $DISK%. Enviado em $DATE Horário da aletta." | mail -s "Warning - DISK FULL - $DISK%" $EMAILS
fi
