-- Hidden grading tests for module-14
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM customer_contacts;
SELECT CONCAT(customer_id, '|', full_name, '|', email_address, '|', joined_on)
FROM customer_contacts
ORDER BY customer_id;

