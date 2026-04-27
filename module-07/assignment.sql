-- module-07 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Employees;
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

