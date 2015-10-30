# unifi_backup

## Description

This script creates a backup of your Ubiquiti UniFi controller data.

## Features

- Creates a local backup of your UniFi data directory

## Requirements

- Debian 7 or later
- Ubuntu 12 or later

* This script has not been tested on earlier releases of Debian/Ubuntu

## Instructions

Copy the unifi_installer.sh file to your server and make the script executable.

    chmod +x unifi_backup.sh
    
Execute the script

    ./unifi_backup.sh

To schedule backups to run daily copy it to your cron folder

    cp -p unifi_backup.sh /etc/cron.daily/

## Notes

Make sure the file and folder owner and permissions are correct for the script to execute.

## Support

There is no support offered for using this script. If you find a bug, please create an issue for it.

If you would like to make a feature request please be descriptive.
