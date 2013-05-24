#!/bin/sh
#
#Script de instalacao do bee-v0.1
#Versao 0.2
#Licenca GPL3
#Autor: Marcos Adriano
#E-mail: marcosadriano@tagi.com.br
#
#Co-Autor: Antonio Fernandes
#E-mail: fernandes@pelivre.org
#
#
#Criando diretorio dos vhosts

### CONFIG'S

CONF_BEE="/etc/bee"
CONF_APACHE="/etc/apache2"

### COMMAND's

MKDIR="$(which mkdir)"
CP="$(which cp)"
APACHECTL="$(which apachectl)"

#### INSTALL 

if [ -d "$CONF_APACHE" ]; then

		if [ ! -d "$CONF_BEE" ]; then
			echo -e "\nInstall Bee."
			$MKDIR -p $CONF_BEE/vhosts/ 

			echo "Backup apache2.conf -> $CONF_APACHE/apache2.conf_backup.bee"
			$CP $CONF_APACHE/apache2.conf $CONF_APACHE/apache2.conf_backup.bee

			## Adicionando -> Include /etc/bee/vhosts
			echo "Adding directory "Include vhost" in apache2.conf."
			echo -e "\n## VHosts directory\nInclude $CONF_BEE/vhosts" >> $CONF_APACHE/apache2.conf

			## Restartando o apache
			echo "Restart apache2."
			
			$APACHECTL restart
			
			echo -e "OK\n"

	  	else
			echo -e "\nDirectory "$CONF_BEE" already exists.\nPlease change the variable "CONF_BEE".\n"
		fi

  else

     echo -e "\nDirectory "$CONF_APACHE" does not exist.\nPlease install "apache2" ( if System Operation Debian GNU/Linux, then, apt-get install apache2 ).\n"

fi
