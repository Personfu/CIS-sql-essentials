Let's jump right in and start learning how to use SQL for the real world!

SQL query statements are used to retrieve data from a database. To write query statements, you need to understand how the database you are using is designed. This could be a database model diagram or a printout of the database tables.

The tables used in this course are from different tables and schemas. Schemas are used to combine related tables within a database, like a grouping. Many times, schemas are used to limit access to the data. A user can be given access to a schema but not to all schemas. This will allow access to only those tables in schema.

The following schema and tables will be used in the examples:

- example.orders
- example.products
- example.inventory

## Writing SQL Queries

There are two components that will **always** be present in every SQL query that you write to retrieve data:

- `SELECT`
- `FROM`

`SELECT` indicates that you are **retrieving** data. And `FROM` specifies which database table you are pulling that data from.

> When you add the `FROM` to your query, if your database has schemas, write it as `schemaname.tablename`.

The query below will pull all rows and columns from the `orders` table within the `example` schema.

- Copy and paste the query (in the code block below) into your _query.sql_ workspace window (top right) where it says `-- Write your query here`. You can either replace the current text or paste it under the text.

```sql
SELECT * FROM example.orders;
```

> Anytime you see `--` within a query, it is signifying that the subsequent text is a **comment** and will be ignored when the query is run.

- Finally, click the blue "Run" button at the bottom right to see the results in the SQL View, the bottom window of the workspace.

In the code block above, the `*` is considered a **wildcard** signifying all columns. If you want to retrieve only certain columns from a table, instead of a `*`, write the name of each column you want to see and separate them with a comma, like so:

```sql
SELECT order_id,
 customer_id,
  order_qty
FROM example.orders;
```

Try the above query to see the results in the SQL View.

It is always a good practice to end your query with a semi-colon (`;`). This signifies that any code after the `;` is part of a different query.

> As you progress through the lessons, you may need to delete your previous query from the _query.sql_ workspace. Otherwise you will be running multiple queries at one time.

It's also possible to "hard-code" your own value into a column. When doing so, the value that you specify will occur in every row in your results. If it is a text value, you will need to put single quotes (`' '`) around the text. If it is a number, simply writing the number will do. When creating your own values, it's a good idea to name the column (see the example below).

```sql
SELECT order_id,
  'new_order' AS order_type
FROM example.orders;
```

Creating columns with your own values is a good way to tag data that you can reference at a later time. We'll see in future lessons how this can be useful.

> If your query results in the SQL View workspace says "Query completed" but there is no data results, check and make sure that the query was copied/written correctly.
