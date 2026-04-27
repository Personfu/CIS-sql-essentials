-- module-11 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Tickets;
DROP VIEW IF EXISTS ticket_priority;

CREATE TABLE Tickets (
  ticket_id INT PRIMARY KEY,
  issue VARCHAR(120) NOT NULL,
  severity INT NOT NULL
);

INSERT INTO Tickets (ticket_id, issue, severity) VALUES
  (1, 'Login fails for valid user', 5),
  (2, 'Page layout broken', 2),
  (3, 'Unable to upload image', 4),
  (4, 'Typo on homepage', 1);

CREATE OR REPLACE VIEW ticket_priority AS
SELECT
  ticket_id,
  issue,
  severity,
  CASE
    WHEN severity >= 5 THEN 'Critical'
    WHEN severity >= 3 THEN 'High'
    WHEN severity = 2 THEN 'Medium'
    ELSE 'Low'
  END AS priority
FROM Tickets
ORDER BY ticket_id;

