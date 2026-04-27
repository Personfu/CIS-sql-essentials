-- Hidden grading tests for module-01
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM Products;
SELECT CONCAT(product_id, '|', product_name, '|', price, '|', category)
FROM Products
ORDER BY product_id;

