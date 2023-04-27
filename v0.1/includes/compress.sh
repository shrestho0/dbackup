


export today=$(date +%F)
today=$(date +%F)

echo -e "$STATUS_COLOR_DO"
printf "Compressing directory..\n"
printf "$STATUS_COLOR_DIR" && ls && printf "$STATUS_COLOR_END"
sleep 1

printf "$STATUS_COLOR_FW"
####### UNCOMMENT AFTER DONE Till Line 19 ####### 

cd ../
tar -czvf $SERVER_NAME-$today.tar.gz www/

sleep 1
cd dbackup/
sleep 1

printf "\n${STATUS_COLOR_OK}Backup file created: $SERVER_NAME-$today.tar.gz\n"

printf "$STATUS_COLOR_END"

sleep 1
