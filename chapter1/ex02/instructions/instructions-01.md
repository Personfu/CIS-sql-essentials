If you don't want to return all of the rows contained in the table you are querying against, you can add a `LIMIT` at the end of the query to specify how many rows should be returned.

```sql
SELECT * FROM example.orders LIMIT 20;
```

Adding a `LIMIT` to the end of your query is a good way to check out the structure of a table without pulling every single row. There will be times in the real world where you will encounter very large tables, and pulling every row can put stress on the underlying data server. Sometimes pulling all data from huge tables (millions, or even billions of rows) can crash those servers! By throwing a `LIMIT` onto the end of your query, you can avoid that happening.

To pull specific data from a table instead of every row, you will need to add a `WHERE` clause after the `FROM`. In this clause, you can ensure that only data that meets specific criteria will be returned in your results. Run the query below to see how it works.

```sql
SELECT *
FROM example.products
WHERE size = 10;
```

In a later lesson, we will go over the different logical operators that can be used within the `WHERE` clause. For now, and in the next few exercises, we will only use `=` (equal to) or `<>` (not equal to).

