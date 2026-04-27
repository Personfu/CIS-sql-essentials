-- Hidden grading tests for module-11
-- The module autograder will compare this output against expected_output.txt.
SELECT COUNT(*) FROM ticket_priority;
SELECT CONCAT(ticket_id, '|', priority)
FROM ticket_priority
ORDER BY ticket_id;

