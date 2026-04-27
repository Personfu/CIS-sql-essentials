# Final Project: Database Design, Normalization, and Implementation

**Course:** SQL Essentials for the Real World (CIS276DA)
**Module:** Final Project
**Learning Outcomes:**
- 13.1 Identify tables, columns, keys, relationships, and indexes (CLO 1,4,7)
- 13.2 Normalize structure to third normal form (CLO 1,2,7)
- 13.3 Create and work with EER models and diagrams (CLO 1,2,4,7,8)
- 13.4 Analyze normalization impact on performance (CLO 1,2)
- 13.5 Write DDL for tables, constraints, and indexes (CLO 1,4,7)
- 13.6 Apply and explain indexes (CLO 4,5,7)
- 13.7 Compare MySQL character sets (CLO 1,4,7)
- 13.8 Explain collation and character sets (CLO 4,7)

---

## Part 1: Designing a Database
1. **EER Model from Script**
   - Use MySQL Workbench to create an EER model from `create_my_guitar_shop.sql`.
   - Generate an EER diagram showing relationships between all seven tables (note: `administrators` is not related to the others).
   - Export and submit your EER diagram as a PDF or PNG.

2. **Custom EER Model**
   - Design a new EER model for a database tracking user downloads:
     - Each user: email, first name, last name
     - Each user can have multiple downloads
     - Each download: filename, download date/time
     - Each product: name; can be related to multiple downloads
   - Create the EER diagram and define all relationships using existing columns.
   - Export and submit your EER diagram as a PDF or PNG.

3. **Export DDL**
   - Export the DDL script for your custom EER model as `ex10-3.sql`.
   - Review and submit the script.

---

## Part 2: Creating Databases, Tables, and Indexes
1. **Add an Index**
   - Write a script to add an index to the `my_guitar_shop` database for the `zip_code` field in the `Customers` table.

2. **Implement a New Database**
   - Write a script to implement the `my_web_db` design:
     - Drop the database if it exists
     - Create/select the database
     - Create all tables with appropriate columns, keys, and indexes
     - Use `utf8mb4` character set and `InnoDB` engine for all tables
     - Add necessary indexes

3. **Insert Data**
   - Add two rows to `Users` and `Products` tables
   - Add three rows to `Downloads` (see instructions for details)
   - Use `NOW()` for download date

4. **Join Query**
   - Write a SELECT statement joining all three tables, retrieving and sorting as specified

5. **ALTER TABLE**
   - Add two columns to `Products`: `price` (DECIMAL(5,2), default 9.99) and `added_date` (DATETIME)
   - Modify `Users.first_name` to NOT NULL and max 20 chars
   - Attempt to insert NULL and over-length values (should fail)

---

## Part 3: Character Sets and Collation
1. **Character Sets**
   - Identify three common MySQL character sets. For each, explain pros/cons and use cases.
2. **Collation**
   - Explain how collation works with character sets and why it matters.

---

## Submission Instructions
- Create a folder named `LastnameFirstname-Final`
- Add all SQL scripts, EER diagrams, and written answers
- Zip the folder and submit as `LastnameFirstname-Final.zip`

---

## Rubric
- Database design and EER diagrams: 30%
- SQL scripts (DDL, DML, ALTER, JOIN): 30%
- Character set/collation analysis: 15%
- Submission format and completeness: 10%
- Clarity, professionalism, and documentation: 15%

---

**Instructor:** Personfu
**Support:** See docs/Support.md for help.