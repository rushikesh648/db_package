#!/bin/bash

# --- Configuration ---
MYSQL_USER="root"
MYSQL_PASS="your_root_password"  # Replace with your actual password
DB_NAME="MyNewAppDB"
TABLE_NAME="users"

# Command to execute SQL queries using the MySQL client
# The -e option allows executing a single SQL statement directly.

# --- 1. CREATE DATABASE ---
echo "Attempting to create database: $DB_NAME..."

mysql -u $MYSQL_USER -p$MYSQL_PASS -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

if [ $? -eq 0 ]; then
    echo "Database '$DB_NAME' created successfully (or already exists)."
else
    echo "ERROR: Failed to create database '$DB_NAME'."
    exit 1
fi

# --- 2. CREATE TABLE and INSERT Data ---
echo "Creating table '$TABLE_NAME' and inserting data..."

# Use a 'Here-Document' (<<EOF...EOF) to run multiple SQL commands
# on the specified database.
mysql -u $MYSQL_USER -p$MYSQL_PASS $DB_NAME <<EOF
    CREATE TABLE IF NOT EXISTS $TABLE_NAME (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(100) UNIQUE
    );
    INSERT INTO $TABLE_NAME (name, email) VALUES ('Alice Smith', 'alice@example.com');
    INSERT INTO $TABLE_NAME (name, email) VALUES ('Bob Johnson', 'bob@example.com');
EOF

if [ $? -eq 0 ]; then
    echo "Table '$TABLE_NAME' created and data inserted successfully."
else
    echo "ERROR: Failed to create table or insert data."
    exit 1
fi

# --- 3. EXECUTE SELECT Query and Capture Output ---
echo -e "\n--- SELECT QUERY RESULTS ---"

# The -N (skip column names) and -B (batch mode, tab-separated) options
# make the output clean and easy to use in a script.
QUERY_RESULT=$(mysql -u $MYSQL_USER -p$MYSQL_PASS $DB_NAME -N -B -e "SELECT id, name FROM $TABLE_NAME WHERE id > 0;")

# Print the captured result
echo "$QUERY_RESULT"

# --- Optional: Process the result in Bash (e.g., read line by line) ---
echo -e "\n--- Processing Data in Bash ---"
echo "$QUERY_RESULT" | while read ID NAME; do
    echo "User ID: $ID, Name: $NAME"
done

echo "Script finished."
