-- Hidden grading tests for module-03
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM discounted_products;
SELECT CONCAT(Product, '|', Cost)
FROM discounted_products
ORDER BY Cost DESC;

