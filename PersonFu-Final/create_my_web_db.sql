-- PersonFu-Final: create_my_web_db.sql
-- Creates my_web_db with utf8mb4, InnoDB, and normalized download tracking schema.

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(6,2) NOT NULL DEFAULT 9.99,
    date_added DATETIME NOT NULL DEFAULT NOW()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE downloads (
    download_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    filename VARCHAR(255) NOT NULL,
    download_date DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE INDEX idx_downloads_user_id ON downloads(user_id);
CREATE INDEX idx_downloads_product_id ON downloads(product_id);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_products_name ON products(product_name);

INSERT INTO users (email, first_name, last_name)
VALUES
  ('cassandra@example.com', 'Cassandra', 'Lee'),
  ('andrew@example.com', 'Andrew', 'Scott');

INSERT INTO products (product_name, price)
VALUES
  ('Business Intelligence Guide', 29.99),
  ('Advanced SQL Video Course', 49.99);

INSERT INTO downloads (user_id, product_id, filename, download_date)
VALUES
  (1, 2, 'advanced_sql_video.mp4', NOW()),
  (2, 1, 'business_intelligence_guide.pdf', NOW()),
  (2, 2, 'advanced_sql_video.mp4', NOW());
