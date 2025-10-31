USE ${DB_NAME};

CREATE TABLE IF NOT EXISTS inventory (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT DEFAULT 0,
    price DECIMAL(10, 2) NOT NULL,
    INDEX idx_name (name)
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
