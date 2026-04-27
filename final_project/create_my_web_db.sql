-- Final Project SQL script for my_web_db

DROP DATABASE IF EXISTS my_web_db;
CREATE DATABASE my_web_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE my_web_db;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE downloads (
    download_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    filename VARCHAR(255) NOT NULL,
    download_date DATETIME NOT NULL,
    INDEX idx_downloads_user_id (user_id),
    INDEX idx_downloads_product_id (product_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO users (email, first_name, last_name)
VALUES
  ('cassandra@example.com', 'Cassandra', 'Lee'),
  ('andrew@example.com', 'Andrew', 'Scott');

INSERT INTO products (product_name)
VALUES
  ('Business Intelligence Guide'),
  ('Advanced SQL Video Course');

INSERT INTO downloads (user_id, product_id, filename, download_date)
VALUES
  (1, 2, 'advanced_sql_video.mp4', NOW()),
  (2, 1, 'business_intelligence_guide.pdf', NOW()),
  (2, 2, 'advanced_sql_video.mp4', NOW());

SELECT 'DATA SUMMARY' AS section;
SELECT COUNT(*) AS users_count FROM users;
SELECT COUNT(*) AS products_count FROM products;
SELECT COUNT(*) AS downloads_count FROM downloads;
SELECT COUNT(*) AS download_relationships
FROM downloads d
JOIN users u ON d.user_id = u.user_id
JOIN products p ON d.product_id = p.product_id;

SELECT 'DESCRIBE users' AS note;
DESCRIBE users;
SELECT 'DESCRIBE products' AS note;
DESCRIBE products;
SELECT 'DESCRIBE downloads' AS note;
DESCRIBE downloads;

SELECT 'SHOW CREATE TABLE users' AS note;
SHOW CREATE TABLE users;
SELECT 'SHOW CREATE TABLE products' AS note;
SHOW CREATE TABLE products;
SELECT 'SHOW CREATE TABLE downloads' AS note;
SHOW CREATE TABLE downloads;

SELECT 'ORDERED DOWNLOADS REPORT' AS note;
SELECT u.email,
       p.product_name,
       d.filename,
       d.download_date
FROM downloads d
JOIN users u ON d.user_id = u.user_id
JOIN products p ON d.product_id = p.product_id
ORDER BY u.email DESC, p.product_name ASC;
