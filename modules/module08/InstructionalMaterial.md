# Module 8 Instructional Material and Presentation

## MySQL Backup and Restore Strategies
- Full vs. incremental backups
- Using mysqldump for logical backups
- Restoring from backup files
- Recovery planning and testing

## Example: Full Backup with mysqldump
```sql
mysqldump -u root -p mydb > mydb_backup.sql
```

## Example: Restore from Backup
```sql
mysql -u root -p mydb < mydb_backup.sql
```

---

For more examples, see scripts in `../../scripts/book_scripts/ch19/` and solutions in `../../scripts/ex_solutions/ch19/`.