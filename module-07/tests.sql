-- Hidden grading tests for module-07
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM top_earners;
SELECT CONCAT(employee_id, '|', employee_name, '|', department, '|', salary)
FROM top_earners
ORDER BY department, salary DESC;

