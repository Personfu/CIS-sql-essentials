-- Hidden grading tests for module-04
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM electronics;
SELECT CONCAT(product_name, '|', price)
FROM electronics
ORDER BY price;

