-- Hidden grading tests for module-13
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM department_sales;
SELECT CONCAT(department, '|', total_amount)
FROM department_sales
ORDER BY department;

