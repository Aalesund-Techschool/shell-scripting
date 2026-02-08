#!/bin/bash

# Simple backup script
# TODO: Add error handling

SOURCE_DIR="/home/user/documents"
BACKUP_DIR="/home/user/backups"

echo "Starting backup..."

# TODO: Implement actual backup logic
cp -r "$SOURCE_DIR" "$BACKUP_DIR"

echo "Backup completed!"
