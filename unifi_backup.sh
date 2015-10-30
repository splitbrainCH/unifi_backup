#!/bin/bash

####################################################################################################
# unifi_backup.sh                                                                                  #
#                                                                                                  #
# This script will make a backup of the UniFi controller data directory to local disk. You can     #
# automate this process by adding it to your daily cron job schedule.                              #
#                                                                                                  #
# Authors: Mark Hadjar                                                                             #
# Version: 1.0                                                                 Updated: 2015-10-30 #
####################################################################################################
# CONFIGURATION

# Path to UniFi controller data directory
UCDDIR="/var/lib/unifi/data/";

# Path to backup directory
BKPDIR="/path/to/backups/";

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
tar -C ${UCDDIR} -czf ${BKPDIR}/${DATE}_unifi.tar.gz

# Start UniFi service
service unifi start

# End backup process
printf "\n--- UniFi Controller Backup Completed ---\n\n"
