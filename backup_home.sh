#!/bin/bash

if [ $# -gt 0 ]; then  
		
	for Username in "$@"
	do
		echo "Checking if user with name ${Username} exists in the system."

		if  grep -q "^${Username}:" /etc/passwd ; then 

		    echo "The user ${Username} exists."
		    echo "Checking if the user ${Username} has a home directory."
		    HomeDir=$( grep "${Username}" /etc/passwd | cut -d ":" -f6 )
		    
		    if [ $HomeDir != "" ]; then
		    	echo "The user ${Username} has a home directory"
		    	echo $HomeDir	    	
				echo "Creating backup for the user ${Username}..."
				mkdir -p /var/backups/users/${Username}
				tar -P -cvpzf /var/backups/users/${Username}/${Username}_home_$(date +"%Y%m%d").tar.gz $HomeDir
				echo " ~~~~~~~~~~~~~~~~~~~~~~~ DONE ~~~~~~~~~~~~~~~~~~~~~~~ "
			else
				echo "The user ${Username} does not have a directory."
			fi
		else
		    echo "The user ${Username} does not exists in the system."
		fi
    done

else
	echo "Error: please enter a username or usernames as parameters."
fi 
