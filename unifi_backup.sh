#!/bin/bash

####################################################################################################
# unifi_backup.sh                                                                                  #
#                                                                                                  #
# This script will make a backup of the UniFi controller data directory to local disk. You can     #
# automate this process by adding it to your daily cron job schedule.                              #
#                                                                                                  #
# Authors: Mark Hadjar                                                                             #
# Version: 1.0                                                                 Updated: 2015-10-30 #
#
# https://github.com/markhadjar/unifi_backup/blob/master/unifi_backup.sh
#
# modified by wenro 2016/04/10
####################################################################################################
# CONFIGURATION

# Path to UniFi controller data directory
UCDDIR="/var/lib/unifi/";

# Path to backup directory
BKPDIR="/srv/backup/unifi/";

# END CONFIGURATION
####################################################################################################
# PROGRAM

# Get current date
DATE=$(date +%Y-%m-%d)

# Start backup process
printf "\n--- UniFi Controller Backup Starting ---\n\n"

# Stop UniFi service
service unifi stop

# Change directory to /
cd /

# Create backup folder if it doesn't exist
mkdir -p $BKPDIR

# Create UniFi backup file
printf "Creating backup file ${DATE}_unifi.tar.gz\n"
tar -czfv ${BKPDIR}${DATE}_unifi.tar.gz ${UCDDIR}

# Start UniFi service
service unifi start

# End backup process
printf "\n--- UniFi Controller Backup Completed ---\n\n"
