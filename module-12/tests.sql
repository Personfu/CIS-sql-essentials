-- Hidden grading tests for module-12
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM sales_rank;
SELECT CONCAT(sale_id, '|', product_name, '|', sale_amount, '|', product_rank)
FROM sales_rank
ORDER BY product_name, product_rank, sale_id;

