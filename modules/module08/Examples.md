# Module 8 Examples

## Example 1: Full Backup with mysqldump
```bash
mysqldump -u root -p mydb > mydb_backup.sql
```

## Example 2: Restore from Backup
```bash
mysql -u root -p mydb < mydb_backup.sql
```

## Example 3: Incremental Backup (Concept)
- Use binary logs to capture changes since the last full backup
- Apply binary logs to restore incremental changes

---

For more examples, see scripts in `../../scripts/book_scripts/ch19/` and solutions in `../../scripts/ex_solutions/ch19/`.