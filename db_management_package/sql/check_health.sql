-- Check the size of the database (for MySQL)
SELECT 
    table_schema AS 'Database', 
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS 'Size_in_MB' 
FROM 
    information_schema.tables 
WHERE 
    table_schema = '${DB_NAME}' 
GROUP BY 
    table_schema;

-- Check for currently running queries
SHOW FULL PROCESSLIST;
