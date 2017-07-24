#!/bin/sh

# multiAVscanners.sh - Script BASH para atualizar ou fazer varreduras em arquivos com AVs no Linux.
#
# Paulo S. G. Ferraz - paulosgf.pf@gmail.com
#
# --------------------------------------------------------------------------------------------------------------
#
# Uso:
# multiAVscanners.sh "arquivo a ser varrido"... OU...
#
# multiAVscanners.sh update
#
# --------------------------------------------------------------------------------------------------------------
#
# Histórico:
#
# v1.0 - Sáb Jul 22 19:49:33 BRT 2017 - Paulo S. G. Ferraz
#       - Versão inicial, com função de ajuda, outra para atualização dos AVs e outra para a varredura de um 
#         arquivo.
#
# -------------------------------------------------------------------------------------------------------------
#
# COPYRIGHT: Este programa é GPL.
#
# -------------------------------------------------------------------------------------------------------------
#
# Funções:

# Ajuda do script
ajuda()	{
	echo "$0 - Faltou argumento..."
	echo
	echo "Uso:"
	echo "$0 \"arquivo a ser varrido\"... OU..."
	echo "$0 update"
	echo
	exit 1
}

# Se não há argumento, exibe a ajuda
[ "$#" -eq 0 ] && ajuda;

# Inicia os AVs
daemonStart() {
### Inicia daemons ###

# Clamav
sudo service clamav-daemon status > /dev/null; [ "$?" -ne 0 ] && sudo service clamav-daemon start
sudo service clamav-freshclam status > /dev/null; [ "$?" -ne 0 ] && sudo service clamav-freshclam start

# avast
sudo service avast status > /dev/null; [ "$?" -ne 0 ] && sudo service avast start

# AVG
sudo service avgd status > /dev/null; [ "$?" -ne 0 ] && sudo service avgd start

# F-Prot
# não tem daemon

# Comodo
sudo service cmdavd status > /dev/null; [ "$?" -ne 0 ] && sudo service cmdavd start
sudo service iodined status > /dev/null; [ "$?" -ne 0 ] && sudo service iodined start

# Zoner
sudo service zavd status > /dev/null; [ "$?" -ne 0 ] && sudo service zavd start

# Sophos
sudo service sav-protect status > /dev/null; [ "$?" -ne 0 ] && sudo service sav-protect start

# Kaspersky
sudo service kav4fs-supervisor status > /dev/null; [ "$?" -ne 0 ] && sudo service kav4fs-supervisor start

# BitDefender
sudo service bd status > /dev/null; [ "$?" -ne 0 ] && sudo service bd start

# Avira
sudo service avguard status > /dev/null; [ "$?" -ne 0 ] && sudo service avguard start

}

# Para os AVs
daemonStop()	{
sudo service clamav-daemon stop
sudo service clamav-freshclam stop
sudo service avast stop
sudo service cmdavd stop
sudo service iodined stop
sudo service zavd stop
sudo service sav-protect stop
sudo service kav4fs-supervisor stop
sudo service avguard stop
sudo service avgd stop
sudo service bd stop
}

# Atualiza os AVs
atualiza()	{	
	# clamav
	sudo freshclam
		if [ "$?" -eq 0 ]; then
			echo -e '\033[43;34m Clamav \033[m'
			echo -e "\033[43;31;1;5m Update Ok\033[m"
		else 
			echo -e '\033[43;34m Clamav \033[m'
			echo -e "\033[43;31;1;5m Update Falhou\033[m"
		fi
	# avast
	sudo /var/lib/avast/Setup/avast.vpsupdate
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Avast \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Avast \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# avg
	sudo avgupdate
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m AVG \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m AVG \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# f-prot
	sudo /opt/f-prot/fpupdate
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m F-prot \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m F-prot \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# comodo
	sudo /opt/COMODO/cavupdater
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Comodo \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Comodo \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# Zoner
	sudo /etc/init.d/zavd update
	sudo /etc/init.d/zavd restart
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Zoner \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Zoner \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# Sophos
        sudo /opt/sophos-av/bin/savupdate -v 5
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Sophos \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Sophos \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# Kaspersky
	sudo foobar
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Kaspersky \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Kaspersky \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# BitDefender
	sudo /opt/BitDefender-scanner/bin/bdscan --update
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m BitDefender \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m BitDefender \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# Avira
	sudo /usr/lib/AntiVir/guard/avupdate-guard --product=Guard
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Avira \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Avira \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
}

# Faz varredura de virus em arquivo
varredura()	{
# Scan
	# clamav
	RETORNO=$(sudo clamscan "$1")
	echo -e '\033[43;34m Clamav \033[m'
	echo -e "\033[43;31;1;5m $RETORNO \033[m"
	unset RETORNO
	echo
	# avast
        RETORNO=$(sudo scan "$1")
        echo -e '\033[43;34m Avast \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# avg
        RETORNO=$(sudo avgscan "$1")
        echo -e '\033[43;34m AVG \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# f-prot
        RETORNO=$(sudo /opt/f-prot/fpscan -r "$1")
        echo -e '\033[43;34m F-prot \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# comodo
        RETORNO=$(sudo /opt/COMODO/cmdscan -v -s "$(pwd)/$1")
        echo -e '\033[43;34m Comodo \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# zoner
        RETORNO=$(sudo zavcli "$1")
        echo -e '\033[43;34m Zoner \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# sophos
        RETORNO=$(sudo /opt/sophos-av/bin/savscan -sc -f -rec "$1")
        echo -e '\033[43;34m Sophos \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# kaspersky
        RETORNO=$(sudo /opt/kaspersky/kav4fs/bin/kav4fs-control --scan-file "$1")
        echo -e '\033[43;34m Kaspersky \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# bitdefender
        RETORNO=$(sudo /opt/BitDefender/bin/bdconsole -f "$1")
        echo -e '\033[43;34m BitDefender \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# avira
        RETORNO=$(sudo /usr/lib/AntiVir/guard/avscan --quarantine-dir=/tmp --heur-level=3 -V "$1")
        echo -e '\033[43;34m Avira \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
}	

# Corpo do script
daemonStart

# Scan ou Update...

if [ $1 = update ]; then 
	atualiza
else
	varredura
fi

daemonStop
