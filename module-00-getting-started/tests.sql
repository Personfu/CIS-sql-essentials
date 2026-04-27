-- Hidden grading tests for module-00-getting-started
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM orientation_check;
SELECT CONCAT(id, '|', name, '|', DATE_FORMAT(started_date, '%Y-%m-%d'))
FROM orientation_check
ORDER BY id;

