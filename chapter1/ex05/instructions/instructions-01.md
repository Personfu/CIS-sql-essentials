**Logical operators** are a way to compare one field to a value or another field. Most commonly used in the `WHERE` clause, logical operators are a way to filter the results of your query.

Each logical operator is represented like so:

* Less than: `<`
* Greater than: `>`
* Less than or equal to: `<=`
* Greater than or equal to: `>=`

All of these logical operators work exactly how inequalities worked in math class way back in the day. Within a query, they can be used to compare against numerical values, dates, and even text.

Run each of the example queries below to see how logical operators work for different data types.

For numerical values, the function is pretty standard. If the condition is met, the results that meet the condition will be returned.

```sql
SELECT sku,
  size
FROM example.products
WHERE size >= 10.5;
```

For dates, the function is similar. **Less than** translates to "before" the specific date or date field being compared, and **greater than** translates to "after".

```sql
SELECT order_id,
 completed_at
FROM example.orders
WHERE completed_at < '2016-09-13';
```

When using logical operators to compare against text, you will need to think alphabetically. **Less than** would mean "closer to A in the alphabet" and **greater than** would mean "closer to Z in the alphabet". Run the query below to see which results are returned.

```sql
SELECT sku,
 color
FROM example.products
WHERE color > 'black';
```
It's also possible to compare two fields to each other. When doing so, be sure that the fields have the **same data type**, otherwise, an error will be thrown when you attempt to run your query.

```sql
SELECT * 
FROM example.inventory 
WHERE total_on_hand < total_on_order;
```
