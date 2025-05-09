#!/bin/bash

<< readme
This is a script for backup with 5 day rotation
Usage:
./backup.sh <path to your source> <path to backup folder>
readme

function display_usage {
    echo "Usage: ./backup.sh <path to your source> <path to backup folder>"
}

if [ $# -eq 0 ]; then
    display_usage
    exit 1
fi

source_dir=$1
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
backups_dir=$2

function create_backup {
    zip -r "${backups_dir}/backup_${timestamp}.zip" "${source_dir}" > /dev/null
    if [ $? -eq 0 ]; then
        echo "Backup generated successfully for ${timestamp}"
    fi
}

function perform_rotation {
    backups=($(ls -t "${backups_dir}/backup_"*.zip 2>/dev/null))

    if [ "${#backups[@]}" -gt 5 ]; then
        echo "Performing rotation for 5 days"
        backups_to_remove=("${backups[@]:5}")
        for backup in "${backups_to_remove[@]}"; do
            rm -f "${backup}"
        done
    fi
}

create_backup
perform_rotation  # This runs the 5-day rotation
