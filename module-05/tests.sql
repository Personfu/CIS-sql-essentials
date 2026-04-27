-- Hidden grading tests for module-05
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM sales_summary;
SELECT CONCAT(category, '|', orders_count, '|', total_sales, '|', average_order_value)
FROM sales_summary
ORDER BY category;

