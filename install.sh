#!/bin/sh
#
#Script de instalacao do bee-v0.1
#Versao 0.1
#Licenca GPL3
#Autor: Marcos Adriano
#E-mail: marcosadriano@tagi.com.br
#
#
#Criando diretorio dos vhosts
echo 'Add vhost dir'
mkdir vhosts

#Backup do apache2.conf
echo 'Add backup apache2.conf -> apache2.conf.backup.bee'
cp -r /etc/apache2/apache2.conf /etc/apache2/apache2.conf.backup.bee

#Adicionando -> Include /opt/bee/vhosts
echo 'Add Include vhost directory into apache2.conf'
echo "
#Adicionando diretorio vhosts ao bee
Include /opt/bee/vhosts" >> /etc/apache2/apache2.conf

#Restartando o apache
echo 'Restart apache2'
apache2ctl restart
