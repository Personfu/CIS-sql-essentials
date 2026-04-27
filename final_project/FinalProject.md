# Final Project: MySQL Database Implementation

## Project Overview
This final project demonstrates your ability to design, implement, and test a MySQL database from requirements to working SQL scripts.

### Learning outcomes
- Design tables, keys, relationships, and indexes
- Create databases with `utf8mb4` and `InnoDB`
- Insert sample data and join related tables
- Apply constraints, alter table definitions, and demonstrate validation failures

## Requirements
1. Create the `my_web_db` database using `utf8mb4` and `InnoDB`
2. Create `users`, `products`, and `downloads` tables with the required columns
3. Add indexing to improve query performance
4. Insert sample rows to demonstrate the data model
5. Write a join query sorted by email descending and product ascending
6. Add new columns to `products` for price and date added
7. Modify `users.first_name` to be `NOT NULL` and `VARCHAR(20)`
8. Demonstrate failed updates for NULL and overly long first name values

## Submission instructions
- Create a folder named `LastnameFirstname-Final`
- Add your SQL scripts and sample data files to the folder
- Zip the folder and submit it

## Included sample scripts
See `final_project/create_my_web_db.sql` for the complete database implementation sample.
Also review `final_project/alter_products_users.sql` for the required ALTER TABLE validation and `final_project/query_downloads.sql` for the final reporting join query.
