# Module 6 Examples

## Example 1: Create and Grant Privileges
```sql
CREATE USER 'backup_admin'@'localhost' IDENTIFIED BY 'backup123';
GRANT SELECT, LOCK TABLES ON *.* TO 'backup_admin'@'localhost';
```

## Example 2: Set System Variable
```sql
SET GLOBAL wait_timeout = 600;
```

## Example 3: Backup Strategy (Description)
- Full backup nightly using mysqldump
- Incremental backups every 4 hours
- Store backups on separate server and test recovery monthly

---

For more examples, see the scripts in `../../scripts/book_scripts/ch17/` and solutions in `../../scripts/ex_solutions/ch17/`.