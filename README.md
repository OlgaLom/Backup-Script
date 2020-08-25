# Backup Script

## Description 

>	Note: this script created for educational purposes

A script to backup the home directory of users.<br>
The backup files will be created to the path <code>/var/backups/Username/</code><br>
With name <code>Username_home_YYYYmmdd.tar.gz</code><br>
E.g. : <code>Lomasi_home_20190530.tar.gz</code>

## The flow of the script

* The first step is to get the parameters of the script (the usernames)
* Second step is to check if the user/users exists
* For the third step the script tries to find the home directory of the user
* Finally if the previous steps were performed correctly the scripts creates the backup file.


## How to use

Run the script with parameter tha name of the user as bellow 

```bash 
user$ ./backup_home.sh  Username
```
OR you can run the script with many parameters as bellow in order to create backup for many users.  

```bash 
user$ ./backup_home.sh  Username1 Username2 
```
