#!/bin/bash

# Source the configuration and utility scripts
source ../config.sh
source ../execute_sql.sh

mkdir -p "$BACKUP_DIR"

echo "Starting database backup for ${DB_NAME}..." | tee -a $LOG_FILE

# Use mysqldump (or pg_dump for PostgreSQL)
mysqldump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_FILE" 2>&1 >> $LOG_FILE

if [ $? -eq 0 ]; then
    echo "✅ Backup successful! File saved to: ${BACKUP_FILE}" | tee -a $LOG_FILE
    # Optional: Compress the backup
    gzip "$BACKUP_FILE"
else
    echo "❌ Backup FAILED!" | tee -a $LOG_FILE
    exit 1
fi
