-- Hidden grading tests for module-06
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM customer_order_totals;
SELECT CONCAT(customer_id, '|', customer_name, '|', total_amount)
FROM customer_order_totals
ORDER BY customer_id;

