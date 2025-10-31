#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Load configuration variables from config.env
source config.env

echo "Starting database setup for ${DB_NAME} on ${DB_HOST}..."

# Function to execute an SQL file
execute_sql() {
    local sql_file=$1
    echo "Executing: ${sql_file}"
    # Use the mysql command line client to execute the file contents
    mysql -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} < ${sql_file}
}

# --- Execution Steps ---

# 1. Create the database and necessary user(s)
execute_sql "sql/1_create_db.sql"

# 2. Apply the main schema (tables, constraints, etc.)
execute_sql "sql/2_create_schema.sql"

# 3. Insert initial data (if needed)
# execute_sql "sql/3_insert_data.sql"

echo "✅ Database package deployed successfully!"
