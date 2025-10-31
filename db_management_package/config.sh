#!/bin/bash

# Database Connection Details
DB_HOST="localhost"
DB_PORT="3306"
DB_USER="db_admin"
DB_PASS="secure_admin_pass"
DB_NAME="production_app_db"

# Backup Settings
BACKUP_DIR="/var/backups/db"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${TIMESTAMP}.sql"
LOG_FILE="/var/log/db_management.log"
