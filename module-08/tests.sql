-- Hidden grading tests for module-08
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM low_stock_products;
SELECT CONCAT(product_name, '|', quantity)
FROM low_stock_products
ORDER BY quantity;

