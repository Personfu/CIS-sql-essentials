# Person Fu Final Project Submission

This package contains the complete final project submission for CIS276DA - MySQL Database.
The files are organized for easy review and align with the final project requirements.

## Files included
- `ex10-3.sql` — EER model export script for the `mydb` database.
- `create_my_web_db.sql` — builds the `my_web_db` database, tables, indexes, and sample data.
- `alter_products_users.sql` — applies required schema changes and validates NOT NULL and length constraints.
- `query_downloads.sql` — join query sorted by email descending and product name ascending.
- `add_zip_index_my_guitar_shop.sql` — adds an index on the Customers `zip_code` field in `my_guitar_shop`.
- `ProjectNotes.md` — design notes, normalization explanation, and mapping to course learning outcomes.

## Execution order

1. Run `ex10-3.sql` if you want the exported EER model schema for `mydb`.
2. Run `create_my_web_db.sql` to create the final database and load sample data.
3. Run `alter_products_users.sql` to apply additional schema enhancements and validate constraints.
4. Run `query_downloads.sql` to verify the reporting query.
5. Run `add_zip_index_my_guitar_shop.sql` against `my_guitar_shop` to add the required index.

## Notes

- All tables use `utf8mb4` and `InnoDB`.
- The design is normalized to third normal form for the download-tracking schema.
- The submission is packaged as a single folder suitable for assignment delivery.
