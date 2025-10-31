-- Use conditional creation to prevent errors if the DB already exists
CREATE DATABASE IF NOT EXISTS ${DB_NAME} 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- Switch to the new database
USE ${DB_NAME};

-- Optional: Create a specific application user with limited permissions
CREATE USER IF NOT EXISTS 'app_user'@'localhost' IDENTIFIED BY 'app_secure_pass';
GRANT SELECT, INSERT, UPDATE, DELETE ON ${DB_NAME}.* TO 'app_user'@'localhost';
FLUSH PRIVILEGES;
