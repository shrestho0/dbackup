

source ./includes/colors.sh

source ./includes/s3_check.sh

source ./includes/db_dump.sh

source ./includes/compress.sh

source ./includes/s3_upload.sh

printf "${STATUS_COLOR_OK}\nBackup Successful \n\n${STATUS_COLOR_END}"
printf "${STATUS_COLOR_DO}******************************\n"
printf "(c) dbackup v0.1\n"
printf "Made with ♥ by Shrestho (shresthodcosta)\n"
printf "******************************\n${STATUS_COLOR_END}"
