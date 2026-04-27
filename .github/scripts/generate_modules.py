from pathlib import Path
import json

root = Path(__file__).resolve().parents[2]
modules = [
    {
        'dir': 'module-00-getting-started',
        'title': 'Getting Started',
        'intro': 'Orientation and environment check for the SQL course.',
        'assignment': 'Create a basic table and insert starter rows to confirm the autograder environment.',
        'sql': """DROP TABLE IF EXISTS orientation_check;
CREATE TABLE orientation_check (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  started_date DATE NOT NULL
);

INSERT INTO orientation_check (id, name, started_date) VALUES
  (1, 'Alice', '2026-04-01'),
  (2, 'Bob', '2026-04-02'),
  (3, 'Carol', '2026-04-03');
""",
        'tests': """SELECT COUNT(*) FROM orientation_check;
SELECT CONCAT(id, '|', name, '|', DATE_FORMAT(started_date, '%Y-%m-%d'))
FROM orientation_check
ORDER BY id;
""",
        'expected': """3
1|Alice|2026-04-01
2|Bob|2026-04-02
3|Carol|2026-04-03
""",
    },
    {
        'dir': 'module-01',
        'title': 'Relational Database Basics',
        'intro': 'Create a product table, insert sample rows, and verify that your table stores data correctly.',
        'assignment': 'Create a Products table with the required columns and insert sample product rows.',
        'sql': """DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category VARCHAR(50) NOT NULL
);

INSERT INTO Products (product_id, product_name, price, category) VALUES
  (1, 'Wireless Mouse', 24.99, 'Accessories'),
  (2, 'Mechanical Keyboard', 119.99, 'Accessories'),
  (3, 'USB-C Hub', 39.95, 'Accessories'),
  (4, 'Laptop Stand', 49.00, 'Furniture'),
  (5, 'Noise-Canceling Headphones', 199.50, 'Audio');
""",
        'tests': """SELECT COUNT(*) FROM Products;
SELECT CONCAT(product_id, '|', product_name, '|', price, '|', category)
FROM Products
ORDER BY product_id;
""",
        'expected': """5
1|Wireless Mouse|24.99|Accessories
2|Mechanical Keyboard|119.99|Accessories
3|USB-C Hub|39.95|Accessories
4|Laptop Stand|49.00|Furniture
5|Noise-Canceling Headphones|199.50|Audio
""",
    },
    {
        'dir': 'module-02',
        'title': 'Creating Related Tables',
        'intro': 'Build Customers and Orders tables with a one-to-many relationship.',
        'assignment': 'Create Customers and Orders tables, then insert sample customers and orders that demonstrate the relationship.',
        'sql': """DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(80) NOT NULL,
  email VARCHAR(120)
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers (customer_id, customer_name, email) VALUES
  (1, 'Alice', 'alice@example.com'),
  (2, 'Bob', 'bob@example.com'),
  (3, 'Carol', 'carol@example.com');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
  (1001, 1, '2026-04-05', 120.00),
  (1002, 1, '2026-04-07', 85.00),
  (1003, 2, '2026-04-08', 55.50),
  (1004, 3, '2026-04-09', 99.99);
""",
        'tests': """SELECT COUNT(*) FROM Customers;
SELECT COUNT(*) FROM Orders;
SELECT CONCAT(c.customer_id, '|', c.customer_name, '|', COUNT(o.order_id))
FROM Customers c
LEFT JOIN Orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY c.customer_id;
""",
        'expected': """3
4
1|Alice|2
2|Bob|1
3|Carol|1
""",
    },
    {
        'dir': 'module-03',
        'title': 'Querying a Single Table',
        'intro': 'Use simple SELECT, filtering, sorting, and aliasing to extract results from a table.',
        'assignment': 'Create a Products table, add sample rows, and create a view named discounted_products for products priced above 50.',
        'sql': """DROP TABLE IF EXISTS Products;
DROP VIEW IF EXISTS discounted_products;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category VARCHAR(50) NOT NULL
);

INSERT INTO Products (product_id, product_name, price, category) VALUES
  (1, 'Wireless Earbuds', 79.99, 'Audio'),
  (2, 'Gaming Mouse', 59.95, 'Accessories'),
  (3, 'Desk Lamp', 34.75, 'Lighting'),
  (4, 'Office Chair', 249.00, 'Furniture'),
  (5, 'Webcam', 89.50, 'Video');

CREATE OR REPLACE VIEW discounted_products AS
SELECT
  product_name AS Product,
  price AS Cost
FROM Products
WHERE price > 50;
""",
        'tests': """SELECT COUNT(*) FROM discounted_products;
SELECT CONCAT(Product, '|', Cost)
FROM discounted_products
ORDER BY Cost DESC;
""",
        'expected': """4
Office Chair|249.00
Webcam|89.50
Wireless Earbuds|79.99
Gaming Mouse|59.95
""",
    },
    {
        'dir': 'module-04',
        'title': 'Filtering and Sorting Data',
        'intro': 'Find and sort records using WHERE, BETWEEN, LIKE, and ORDER BY.',
        'assignment': 'Create a Products table, insert sample data, and build a view for electronics priced between 50 and 200.',
        'sql': """DROP TABLE IF EXISTS Products;
DROP VIEW IF EXISTS electronics;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category VARCHAR(50) NOT NULL
);

INSERT INTO Products (product_id, product_name, price, category) VALUES
  (1, 'Smartphone', 699.00, 'Electronics'),
  (2, 'Tablet', 329.99, 'Electronics'),
  (3, 'Bluetooth Speaker', 89.95, 'Electronics'),
  (4, 'Desk Organizer', 19.50, 'Office'),
  (5, 'Monitor', 179.99, 'Electronics');

CREATE OR REPLACE VIEW electronics AS
SELECT product_name, price
FROM Products
WHERE category = 'Electronics' AND price BETWEEN 50 AND 200
ORDER BY price;
""",
        'tests': """SELECT COUNT(*) FROM electronics;
SELECT CONCAT(product_name, '|', price)
FROM electronics
ORDER BY price;
""",
        'expected': """2
Bluetooth Speaker|89.95
Monitor|179.99
""",
    },
    {
        'dir': 'module-05',
        'title': 'Aggregation and Grouping',
        'intro': 'Use GROUP BY, COUNT, SUM, AVG, and HAVING to summarize data.',
        'assignment': 'Create a sales table and build a summary view grouped by category.',
        'sql': """DROP TABLE IF EXISTS Sales;
DROP VIEW IF EXISTS sales_summary;

CREATE TABLE Sales (
  sale_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

INSERT INTO Sales (sale_id, product_name, category, quantity, price) VALUES
  (1, 'Red T-shirt', 'Apparel', 5, 19.99),
  (2, 'Blue Jeans', 'Apparel', 3, 49.50),
  (3, 'Coffee Mug', 'Home', 10, 9.99),
  (4, 'Desk Lamp', 'Home', 2, 34.99),
  (5, 'Running Shoes', 'Apparel', 1, 79.99);

CREATE OR REPLACE VIEW sales_summary AS
SELECT
  category,
  COUNT(*) AS orders_count,
  SUM(quantity * price) AS total_sales,
  ROUND(AVG(quantity * price), 2) AS average_order_value
FROM Sales
GROUP BY category
HAVING total_sales > 0;
""",
        'tests': """SELECT COUNT(*) FROM sales_summary;
SELECT CONCAT(category, '|', orders_count, '|', total_sales, '|', average_order_value)
FROM sales_summary
ORDER BY category;
""",
        'expected': """2
Apparel|3|379.46|126.49
Home|2|169.78|84.89
""",
    },
    {
        'dir': 'module-06',
        'title': 'Joining Tables',
        'intro': 'Combine tables with INNER JOIN, LEFT JOIN, and aggregate joined results.',
        'assignment': 'Create Customers, Products, and Orders tables and build a view of order totals by customer.',
        'sql': """DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP VIEW IF EXISTS customer_order_totals;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(80) NOT NULL
);

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems (
  order_item_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers (customer_id, customer_name) VALUES
  (1, 'Alice'),
  (2, 'Bob');

INSERT INTO Products (product_id, product_name, price) VALUES
  (1, 'Keyboard', 79.99),
  (2, 'Mouse', 29.99),
  (3, 'Monitor', 199.99);

INSERT INTO Orders (order_id, customer_id, order_date) VALUES
  (101, 1, '2026-04-10'),
  (102, 1, '2026-04-11'),
  (103, 2, '2026-04-12');

INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity) VALUES
  (1, 101, 1, 1),
  (2, 101, 2, 2),
  (3, 102, 3, 1),
  (4, 103, 1, 1);

CREATE OR REPLACE VIEW customer_order_totals AS
SELECT
  c.customer_id,
  c.customer_name,
  SUM(oi.quantity * p.price) AS total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY c.customer_id;
""",
        'tests': """SELECT COUNT(*) FROM customer_order_totals;
SELECT CONCAT(customer_id, '|', customer_name, '|', total_amount)
FROM customer_order_totals
ORDER BY customer_id;
""",
        'expected': """2
1|Alice|339.97
2|Bob|79.99
""",
    },
    {
        'dir': 'module-07',
        'title': 'Subqueries and Derived Tables',
        'intro': 'Use subqueries to compare rows and calculate averages for a subset of data.',
        'assignment': 'Create an Employees table and build a view showing employees with above-average salary by department.',
        'sql': """DROP TABLE IF EXISTS Employees;
DROP VIEW IF EXISTS top_earners;

CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(80) NOT NULL,
  department VARCHAR(50) NOT NULL,
  salary DECIMAL(10,2) NOT NULL
);

INSERT INTO Employees (employee_id, employee_name, department, salary) VALUES
  (1, 'Ana', 'Sales', 65000.00),
  (2, 'Brian', 'Sales', 55000.00),
  (3, 'Carmen', 'Engineering', 90000.00),
  (4, 'David', 'Engineering', 75000.00),
  (5, 'Ellen', 'Support', 47000.00);

CREATE OR REPLACE VIEW top_earners AS
SELECT employee_id, employee_name, department, salary
FROM Employees e
WHERE salary > (
  SELECT AVG(salary)
  FROM Employees
  WHERE department = e.department
)
ORDER BY department, salary DESC;
""",
        'tests': """SELECT COUNT(*) FROM top_earners;
SELECT CONCAT(employee_id, '|', employee_name, '|', department, '|', salary)
FROM top_earners
ORDER BY department, salary DESC;
""",
        'expected': """3
1|Ana|Sales|65000.00
3|Carmen|Engineering|90000.00
4|David|Engineering|75000.00
""",
    },
    {
        'dir': 'module-08',
        'title': 'Views and Common Table Expressions',
        'intro': 'Build reusable queries with views and CTEs for clearer logic.',
        'assignment': 'Create product and inventory tables, then build a view that highlights low-stock products.',
        'sql': """DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Products;
DROP VIEW IF EXISTS low_stock_products;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL
);

CREATE TABLE Inventory (
  inventory_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, product_name) VALUES
  (1, 'Notebook'),
  (2, 'Pen'),
  (3, 'Desk Organizer');

INSERT INTO Inventory (inventory_id, product_id, quantity) VALUES
  (1, 1, 25),
  (2, 2, 5),
  (3, 3, 2);

CREATE OR REPLACE VIEW low_stock_products AS
WITH stocked AS (
  SELECT p.product_name, i.quantity
  FROM Products p
  JOIN Inventory i ON p.product_id = i.product_id
)
SELECT product_name, quantity
FROM stocked
WHERE quantity < 10
ORDER BY quantity;
""",
        'tests': """SELECT COUNT(*) FROM low_stock_products;
SELECT CONCAT(product_name, '|', quantity)
FROM low_stock_products
ORDER BY quantity;
""",
        'expected': """2
Desk Organizer|2
Pen|5
""",
    },
    {
        'dir': 'module-09',
        'title': 'Modifying Data',
        'intro': 'Practice INSERT, UPDATE, and DELETE statements to change table data.',
        'assignment': 'Create a Products table, insert sample rows, update prices, delete discontinued products, and leave final results ready for review.',
        'sql': """DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  status VARCHAR(20) NOT NULL
);

INSERT INTO Products (product_id, product_name, price, status) VALUES
  (1, 'Gaming Chair', 249.99, 'Active'),
  (2, 'Desk Lamp', 34.99, 'Active'),
  (3, 'Mouse Pad', 12.50, 'Active'),
  (4, 'Sticker Pack', 4.99, 'Discontinued');

UPDATE Products
SET price = price * 0.90
WHERE status = 'Active';

DELETE FROM Products
WHERE status = 'Discontinued';
""",
        'tests': """SELECT COUNT(*) FROM Products;
SELECT CONCAT(product_id, '|', product_name, '|', price)
FROM Products
ORDER BY product_id;
""",
        'expected': """3
1|Gaming Chair|224.99
2|Desk Lamp|31.49
3|Mouse Pad|11.25
""",
    },
    {
        'dir': 'module-10',
        'title': 'Schema Design and Constraints',
        'intro': 'Define keys, uniqueness, and not-null constraints as part of a strong schema.',
        'assignment': 'Create a Customers table with required constraints and insert sample rows.',
        'sql': """DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(80) NOT NULL,
  email VARCHAR(120) NOT NULL,
  signup_date DATE NOT NULL,
  UNIQUE KEY unique_email (email)
);

INSERT INTO Customers (customer_id, customer_name, email, signup_date) VALUES
  (1, 'Alice', 'alice@example.com', '2026-04-01'),
  (2, 'Bob', 'bob@example.com', '2026-04-02'),
  (3, 'Carol', 'carol@example.com', '2026-04-03');
""",
        'tests': """SELECT COUNT(*) FROM Customers;
SELECT CONCAT(customer_id, '|', customer_name, '|', email)
FROM Customers
ORDER BY customer_id;
""",
        'expected': """3
1|Alice|alice@example.com
2|Bob|bob@example.com
3|Carol|carol@example.com
""",
    },
    {
        'dir': 'module-11',
        'title': 'Conditional Expressions',
        'intro': 'Apply CASE expressions and NULL handling to categorize data.',
        'assignment': 'Create a Tickets table and a view that categorizes ticket priority using CASE.',
        'sql': """DROP TABLE IF EXISTS Tickets;
DROP VIEW IF EXISTS ticket_priority;

CREATE TABLE Tickets (
  ticket_id INT PRIMARY KEY,
  issue VARCHAR(120) NOT NULL,
  severity INT NOT NULL
);

INSERT INTO Tickets (ticket_id, issue, severity) VALUES
  (1, 'Login fails for valid user', 5),
  (2, 'Page layout broken', 2),
  (3, 'Unable to upload image', 4),
  (4, 'Typo on homepage', 1);

CREATE OR REPLACE VIEW ticket_priority AS
SELECT
  ticket_id,
  issue,
  severity,
  CASE
    WHEN severity >= 5 THEN 'Critical'
    WHEN severity >= 3 THEN 'High'
    WHEN severity = 2 THEN 'Medium'
    ELSE 'Low'
  END AS priority
FROM Tickets
ORDER BY ticket_id;
""",
        'tests': """SELECT COUNT(*) FROM ticket_priority;
SELECT CONCAT(ticket_id, '|', priority)
FROM ticket_priority
ORDER BY ticket_id;
""",
        'expected': """4
1|Critical
2|Medium
3|High
4|Low
""",
    },
    {
        'dir': 'module-12',
        'title': 'Window Functions and Ranking',
        'intro': 'Use window functions to rank and compare rows inside result sets.',
        'assignment': 'Create a Sales table and a view that ranks sales by product.',
        'sql': """DROP TABLE IF EXISTS Sales;
DROP VIEW IF EXISTS sales_rank;

CREATE TABLE Sales (
  sale_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  sale_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO Sales (sale_id, product_name, sale_amount) VALUES
  (1, 'Keyboard', 79.99),
  (2, 'Mouse', 29.99),
  (3, 'Monitor', 199.99),
  (4, 'Mouse', 24.99),
  (5, 'Keyboard', 89.99);

CREATE OR REPLACE VIEW sales_rank AS
SELECT
  sale_id,
  product_name,
  sale_amount,
  RANK() OVER (PARTITION BY product_name ORDER BY sale_amount DESC) AS product_rank
FROM Sales;
""",
        'tests': """SELECT COUNT(*) FROM sales_rank;
SELECT CONCAT(sale_id, '|', product_name, '|', sale_amount, '|', product_rank)
FROM sales_rank
ORDER BY product_name, product_rank, sale_id;
""",
        'expected': """5
1|Keyboard|79.99|2
5|Keyboard|89.99|1
4|Mouse|24.99|2
2|Mouse|29.99|1
3|Monitor|199.99|1
""",
    },
    {
        'dir': 'module-13',
        'title': 'Common Table Expressions',
        'intro': 'Build reusable CTEs to simplify complex queries and compare aggregation results.',
        'assignment': 'Create employee and sales data, then build a CTE view that summarizes sales per department.',
        'sql': """DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Sales;
DROP VIEW IF EXISTS department_sales;

CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(80) NOT NULL,
  department VARCHAR(50) NOT NULL
);

CREATE TABLE Sales (
  sale_id INT PRIMARY KEY,
  employee_id INT NOT NULL,
  sale_amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Employees (employee_id, employee_name, department) VALUES
  (1, 'Ana', 'Sales'),
  (2, 'Brian', 'Sales'),
  (3, 'Carmen', 'Engineering');

INSERT INTO Sales (sale_id, employee_id, sale_amount) VALUES
  (1, 1, 1250.00),
  (2, 2, 840.00),
  (3, 1, 620.00),
  (4, 3, 430.00);

CREATE OR REPLACE VIEW department_sales AS
WITH totals AS (
  SELECT e.department, SUM(s.sale_amount) AS total_amount
  FROM Employees e
  JOIN Sales s ON e.employee_id = s.employee_id
  GROUP BY e.department
)
SELECT department, total_amount
FROM totals
ORDER BY department;
""",
        'tests': """SELECT COUNT(*) FROM department_sales;
SELECT CONCAT(department, '|', total_amount)
FROM department_sales
ORDER BY department;
""",
        'expected': """2
Engineering|430.00
Sales|2710.00
""",
    },
    {
        'dir': 'module-14',
        'title': 'String, Date, and NULL Functions',
        'intro': 'Clean and transform data using built-in MySQL functions.',
        'assignment': 'Create a Customers table and a view that formats customer names and handles missing emails.',
        'sql': """DROP TABLE IF EXISTS Customers;
DROP VIEW IF EXISTS customer_contacts;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(120),
  signup_date DATE NOT NULL
);

INSERT INTO Customers (customer_id, first_name, last_name, email, signup_date) VALUES
  (1, 'Alice', 'Anderson', 'alice@example.com', '2026-01-15'),
  (2, 'Bob', 'Brown', NULL, '2026-02-10'),
  (3, 'Carol', 'Clark', 'carol@example.com', '2026-03-05');

CREATE OR REPLACE VIEW customer_contacts AS
SELECT
  customer_id,
  CONCAT(first_name, ' ', last_name) AS full_name,
  COALESCE(email, 'no-email@example.com') AS email_address,
  DATE_FORMAT(signup_date, '%Y-%m-%d') AS joined_on
FROM Customers
ORDER BY customer_id;
""",
        'tests': """SELECT COUNT(*) FROM customer_contacts;
SELECT CONCAT(customer_id, '|', full_name, '|', email_address, '|', joined_on)
FROM customer_contacts
ORDER BY customer_id;
""",
        'expected': """3
1|Alice Anderson|alice@example.com|2026-01-15
2|Bob Brown|no-email@example.com|2026-02-10
3|Carol Clark|carol@example.com|2026-03-05
""",
    },
    {
        'dir': 'module-15',
        'title': 'Procedures and Functions',
        'intro': 'Create stored procedures or functions and run them to return query results.',
        'assignment': 'Create a Products table and a procedure that returns low-stock products.',
        'sql': """DROP PROCEDURE IF EXISTS GetLowStockProducts;
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  quantity INT NOT NULL
);

INSERT INTO Products (product_id, product_name, quantity) VALUES
  (1, 'Charger', 12),
  (2, 'Power Bank', 5),
  (3, 'USB Cable', 30),
  (4, 'Travel Adapter', 3);

DELIMITER $$
CREATE PROCEDURE GetLowStockProducts()
BEGIN
  SELECT product_id, product_name, quantity
  FROM Products
  WHERE quantity < 10
  ORDER BY quantity;
END$$
DELIMITER ;
""",
        'tests': """CALL GetLowStockProducts();
""",
        'expected': """2|Power Bank|5
4|Travel Adapter|3
""",
    },
    {
        'dir': 'module-16',
        'title': 'Triggers and Audit Tables',
        'intro': 'Create triggers that enforce business rules and write audit records automatically.',
        'assignment': 'Create a Products table, an audit table, and a trigger that logs updates.',
        'sql': """DROP TRIGGER IF EXISTS products_after_update;
DROP TABLE IF EXISTS Products_Audit;
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Products_Audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  old_price DECIMAL(10,2),
  new_price DECIMAL(10,2),
  changed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Products (product_id, product_name, price) VALUES
  (1, 'Tablet', 299.00),
  (2, 'Smartwatch', 149.95);

DELIMITER $$
CREATE TRIGGER products_after_update
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
  INSERT INTO Products_Audit (product_id, old_price, new_price)
  VALUES (OLD.product_id, OLD.price, NEW.price);
END$$
DELIMITER ;
""",
        'tests': """UPDATE Products SET price = price + 10 WHERE product_id = 1;
SELECT COUNT(*) FROM Products_Audit;
SELECT CONCAT(product_id, '|', old_price, '|', new_price)
FROM Products_Audit
ORDER BY audit_id;
""",
        'expected': """1
1|299.00|309.00
""",
    },
]

for module in modules:
    mod_dir = root / module['dir']
    mod_dir.mkdir(parents=True, exist_ok=True)
    readme = mod_dir / 'README.md'
    assignment = mod_dir / 'assignment.sql'
    tests = mod_dir / 'tests.sql'
    expected = mod_dir / 'expected_output.txt'

    readme.write_text(
        f"# {module['title']}\n\n{module['intro']}\n\n## Assignment\n\n{module['assignment']}\n\n## Files\n\n- `assignment.sql` — student SQL script\n- `tests.sql` — hidden grading queries\n- `expected_output.txt` — expected test output\n\nDo not edit `tests.sql` or `expected_output.txt`.\n",
        encoding='utf-8'
    )
    assignment.write_text(f"-- {module['dir']} student SQL assignment\n-- Write your SQL solution here.\n{module['sql']}\n", encoding='utf-8')
    tests.write_text(f"-- Hidden grading tests for {module['dir']}\n-- The module autograder will compare this output against expected_output.txt.\n{module['tests']}\n", encoding='utf-8')
    expected.write_text(module['expected'], encoding='utf-8')

progress = {f"{module['dir']}": "pending" for module in modules}
(root / 'progress.json').write_text(json.dumps({'scores': progress}, indent=2) + '\n', encoding='utf-8')
print('Generated modules 00-16 and progress.json')
