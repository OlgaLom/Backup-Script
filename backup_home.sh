#!/bin/bash

if [ $# -gt 0 ]; then  
		
	for Benutzername in "$@"
	do
		echo "Überprüfung, ob Benutzer ${Benutzername} im System vorhanden ist"

		if  grep -q "^${Benutzername}:" /etc/passwd ; then 

		    echo "ja, der benutzer ${Benutzername} existiert."
		    echo "Überprüfen, ob der Benutzer ein Verzeichnis hat"
		    HomeDir=$( grep "${Benutzername}" /etc/passwd | cut -d ":" -f6 )
		    
		    if [ $HomeDir != "" ]; then
		    	echo "das Verzeichnis existiert !"
		    	echo $HomeDir	    	
				echo "Backup für ${Benutzername} erstellen..."
				mkdir -p /var/backups/users/${Benutzername}
				tar -P -cvpzf /var/backups/users/${Benutzername}/${Benutzername}_home_$(date +"%Y%m%d").tar.gz $HomeDir
				echo " ~~~~~~~~~~~~~~~~~~~~~~~ DONE ~~~~~~~~~~~~~~~~~~~~~~~ "
			else
				echo "Der $Benutzername hat kein Verzeichnis"
			fi
		else
		    echo "Nein, der Benutzer ${Benutzername} existiert nicht."
		fi
    done

else
	echo "FEHLER: Bitte geben Sie als Argument Benutzername / Benutzernamen an."
fi 
