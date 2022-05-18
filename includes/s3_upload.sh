
printf "$STATUS_COLOR_FW"
printf "Uploading to S3: $SERVER_NAME-$today.tar.gz\n"
printf "$STATUS_COLOR_UP"


s3cmd put /var/$SERVER_NAME-$today.tar.gz s3://lambdabd-backup/$SERVER_NAME/ -p

sleep 1

printf "$STATUS_COLOR_OK"
printf "Uploaded Successfully\n"
printf "$STATUS_COLOR_END"

sleep 1

printf "$STATUS_COLOR_RED"
printf "Deleting local backup files:$ /var/$SERVER_NAME-$today.tar.gz\n"
sleep 1
rm -rf /var/$SERVER_NAME-$today.tar.gz
printf "Deleting local backup files: /var/www/databases/\n"
rm -rf /var/www/databases/

printf "$STATUS_COLOR_END"