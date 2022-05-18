#! /bin/bash

# Backing up databases
# Creating database directory if not available


DATABASE_DIR="/var/www/databases/"

if [ ! -d $DATABASE_DIR ]
then
    printf "Creating database folder\n" &&
    mkdir $DATABASE_DIR
else
    printf "Deleting existing database files\n" &&
    rm -rf $DATABASE_DIR/*.sql
fi


printf "${STATUS_COLOR_DO}Starting database dump: \n\033[1;0m\n" &&

###### UNCOMMENT TILL LINE 31 ########
mysql -N -e 'show databases' && 
printf "\033[0;\n"

# UNCOMMENT AFTER WORK
mysql -N -e 'show databases' | 
while read dbname; 

    do mysqldump --complete-insert --routines --triggers --single-transaction "$dbname" > "$DATABASE_DIR$dbname".sql; 

done;

sleep 1

printf "\n"

sleep 1

echo -e "Database dump:${STATUS_COLOR_OK} SUCCESSFUL\n"
printf "$STATUS_COLOR_END"
sleep 1

# else
#     echo -e "Database dump: \033[1;31mFailed \n\033[0;0m";
# fi