-- Hidden grading tests for module-10
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM Customers;
SELECT CONCAT(customer_id, '|', customer_name, '|', email)
FROM Customers
ORDER BY customer_id;

