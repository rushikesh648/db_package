#!/bin/bash

HOSTS_FILE="/etc/hosts"
CUSTOM_FILE="./custom_hosts"

echo "Deploying custom host entries..."

# 1. Backup the existing file
cp $HOSTS_FILE ${HOSTS_FILE}.bak

# 2. Append the new entries (recommended for configuration)
cat $CUSTOM_FILE >> $HOSTS_FILE

# OR: Replace the entire file (caution advised)
# cp $CUSTOM_FILE $HOSTS_FILE

echo "Host entries updated. Backup saved to ${HOSTS_FILE}.bak"

# 3. Verify (optional)
grep "app-server-a" $HOSTS_FILE
