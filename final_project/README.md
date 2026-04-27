# Final Project Package

This package contains the final MySQL project scripts and validation support for the SQL course.

## Files included
- `create_my_web_db.sql` — creates the database, tables, indexes, sample rows, and performs initial verification.
- `alter_products_users.sql` — applies required schema changes, validates column definitions, and runs failing constraint tests.
- `query_downloads.sql` — runs the required download report query plus a raw join sanity check.

## Execution order
1. Run `create_my_web_db.sql` first.
   - Expected output: `2` users, `2` products, `3` downloads.
   - Expected validation: `DESCRIBE` and `SHOW CREATE TABLE` output for every table.
2. Run `alter_products_users.sql` second.
   - Expected validation: `products.price`, `products.date_added`, and `users.first_name` metadata.
   - Expected errors: `UPDATE` of `first_name = NULL` and `UPDATE` of an overly long first name should fail.
3. Run `query_downloads.sql` last.
   - Expected output: two result sets, one raw join and one ordered join.

## What the scripts prove
- `create_my_web_db.sql` proves that the schema uses `utf8mb4`, `InnoDB`, and explicit indexes.
- `alter_products_users.sql` proves schema evolution and active constraint enforcement.
- `query_downloads.sql` proves the join output and ordering requirements.

## Notes for grading
- Use MySQL Workbench or the MySQL CLI.
- If executing in CLI, errors from the failed update tests are expected and intentional.
- The `create_my_web_db.sql` file includes verification queries so grading is based on actual outputs, not assumptions.
