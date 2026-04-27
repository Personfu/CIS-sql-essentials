Furulie Preston Final Project Submission

This final package contains the required MySQL scripts for the course deliverable.

Files included:
- create_my_web_db.sql: builds the my_web_db schema, tables, indexes, and sample data.
- alter_products_users.sql: applies required ALTER TABLE changes and validates constraints.
- query_downloads.sql: join query sorted by email DESC and product_name ASC.
- add_zip_index_my_guitar_shop.sql: adds a zip code index to the my_guitar_shop Customers table.

Execution order:
1. Run create_my_web_db.sql to create the database and load sample data.
2. Run alter_products_users.sql to apply schema changes and verify constraints.
3. Run query_downloads.sql to verify the final result set.
4. If requested, run add_zip_index_my_guitar_shop.sql against my_guitar_shop.

Notes:
- All tables use utf8mb4 and InnoDB.
- The schema enforces referential integrity and includes indexes for foreign keys.
- Constraint checks demonstrate failure cases for NOT NULL and length limits.
