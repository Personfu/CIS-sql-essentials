-- Hidden grading tests for module-16
-- The module autograder will compare this output against expected_output.txt.
UPDATE Products SET price = price + 10 WHERE product_id = 1;
SELECT COUNT(*) FROM Products_Audit;
SELECT CONCAT(product_id, '|', old_price, '|', new_price)
FROM Products_Audit
ORDER BY audit_id;

