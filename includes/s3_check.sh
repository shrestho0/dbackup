
echo -e "$STATUS_COLOR_DO"
printf "Compressing directory..\n"
printf "$STATUS_COLOR_END"


if [ -f .env ]
then
    echo ".env file found" &&
    export $(cat .env | xargs)
# data niye s3 te upload korbe
else
    echo ".env file not found"
    touch .env
    break
# data niye s3 te upload korbe

fi

