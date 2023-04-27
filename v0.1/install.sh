#! /bin/bash

# Install if s3cmd not installed

# COLOR_RED = '\033[0;31m'
# COLOR_END = '\033[0m'

# REQUIRED_PKG="s3cmd"

# PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
# echo Checking for $REQUIRED_PKG: $PKG_OK
# if [ "" = "$PKG_OK" ]; then
#   echo -e "${COLOR_RED} * $REQUIRED_PKG Not Installed {COLOR_END}. Setting up $REQUIRED_PKG."
# #   sudo apt-get --yes install $REQUIRED_PKG 
# fi

source ./includes/colors.sh

REQUIRED_PKG="s3cmd"

CHECK_PKG_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $CHECK_PKG_INSTALLED

if [ "" = "$CHECK_PKG_INSTALLED" ]; then
    echo -e "\"$REQUIRED_PKG\" Installation status:$STATUS_COLOR_RED Not installed ${STATUS_COLOR_END}" &&
    echo -e "Installing and setting up $REQUIRED_PKG..." &&
    sudo apt-get --yes install $REQUIRED_PKG &&
    echo -e "\"$REQUIRED_PKG\" Installation status:$STATUS_COLOR_OK Installed ${STATUS_COLOR_END}" &&
    echo -e "\033[1;33mNow you can --configure and run ./backup.sh\033[0m";

    
else
    echo -e "\"$REQUIRED_PKG\" Installation status:$STATUS_COLOR_OK Installed ${STATUS_COLOR_END}" &&
    echo -e "\033[1;33mYou can --configure and run ./backup.sh\033[0m"

fi;


if [ ! -f "/root/.s3cfg" ]; then
    sudo s3cmd --configure
fi

if [ "$1" ]; then
       sudo s3cmd $1
fi

# if [$1 == *"--configure"* ]; then
#     echo "--configure it"
#     # sudo s3cmd --configure
# fi

echo -e "Run Command: ${STATUS_COLOR_FW} sudo vi cat /root/.s3cfg${STATUS_COLOR_END}"
echo -e "Run Command: ${STATUS_COLOR_FW} sudo crontab -e ${STATUS_COLOR_END}"
echo -e "Add this line at the end:${STATUS_COLOR_FW}\n@daily /bin/bash /var/dbackup/backup.sh >> /var/dbackup/backup_cron.log 2>&1 ${STATUS_COLOR_END}"
echo -e "You can edit configaration file in /root/.s3cfg"
