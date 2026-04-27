# Person Fu Final Project Notes

## Project Overview
This submission includes the final MySQL database development work for CIS276DA. It satisfies the final project requirements by demonstrating database design, normalization, indexing, and reporting.

## Key design decisions

- The `my_web_db` schema is normalized to third normal form with separate `users`, `products`, and `downloads` tables.
- Each download record references a single user and a single product, preserving one-to-many relationships.
- All tables use `utf8mb4` and `InnoDB` to support Unicode data and transactional integrity.
- Indexed foreign keys and search columns improve query performance for lookups and joins.

## Assignment mapping

- Part 1: EER modeling and script export are represented by `ex10-3.sql`.
- Part 2: Database creation, indexes, and sample data are in `create_my_web_db.sql`.
- Download reporting is in `query_downloads.sql`.
- Schema updates and constraint validation are in `alter_products_users.sql`.
- The required zip-code index for `my_guitar_shop` is in `add_zip_index_my_guitar_shop.sql`.

## Notes for the instructor

- The schema follows best practices for MySQL table design and normalization.
- The `downloads` table includes explicit foreign keys to enforce referential integrity.
- The `products` table has a default price and timestamp for new product entries.
- Constraint failure tests in `alter_products_users.sql` are intentionally included to demonstrate the NOT NULL and length restrictions.
