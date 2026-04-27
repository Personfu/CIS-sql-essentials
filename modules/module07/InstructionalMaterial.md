# Module 7 Instructional Material and Presentation

## MySQL Security Fundamentals
- User accounts and authentication
- Privilege management: GRANT, REVOKE, and best practices
- Securing data at rest and in transit

## Example: Granting Privileges
```sql
GRANT SELECT, INSERT ON mydb.* TO 'app_user'@'localhost';
```

## Example: Revoking Privileges
```sql
REVOKE INSERT ON mydb.* FROM 'app_user'@'localhost';
```

---

For more examples, see scripts in `../../scripts/book_scripts/ch18/` and solutions in `../../scripts/ex_solutions/ch18/`.