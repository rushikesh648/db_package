#!/bin/bash
# Note: This script assumes you source it from a main management script.

# Function to execute an SQL file against the configured database
execute_sql_file() {
    local sql_file=$1
    echo "$(date) | Executing SQL file: ${sql_file}" >> $LOG_FILE
    
    # Use the appropriate client (e.g., mysql or psql)
    # MySQL Example:
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$sql_file" 2>&1 >> $LOG_FILE

    if [ $? -ne 0 ]; then
        echo "ERROR: SQL execution of ${sql_file} failed." | tee -a $LOG_FILE
        return 1
    fi
    return 0
}
