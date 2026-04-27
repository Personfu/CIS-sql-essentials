-- Hidden grading tests for module-02
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM Customers;
SELECT COUNT(*) FROM Orders;
SELECT CONCAT(c.customer_id, '|', c.customer_name, '|', COUNT(o.order_id))
FROM Customers c
LEFT JOIN Orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY c.customer_id;

