-- module-00-getting-started student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS orientation_check;
CREATE TABLE orientation_check (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  started_date DATE NOT NULL
);

INSERT INTO orientation_check (id, name, started_date) VALUES
  (1, 'Alice', '2026-04-01'),
  (2, 'Bob', '2026-04-02'),
  (3, 'Carol', '2026-04-03');

