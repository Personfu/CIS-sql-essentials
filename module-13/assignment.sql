-- module-13 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Employees;
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

