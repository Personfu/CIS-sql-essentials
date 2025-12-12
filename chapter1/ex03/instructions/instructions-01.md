With SQL, you can add, subtract, multiply, and divide...just like you would do within an Excel file.

Each mathematical operator is represented like so:

- Add: `+`
- Subtract: `-`
- Multiply: `*`
- Divide: `/`

When using mathematical operations, you can only do the arithmetic **across a row, not up and down a column** (mathematical operations within columns requires an aggregate function, which will be covered in a much later lesson).

```sql
SELECT product_code,
 original_price,
 current_price,
 original_price - current_price AS discount_amount
FROM example.products;
```

In the example above, you can see that the value in `current_price` is being subtracted from the value in `original_price`. Since every row in each of those columns has a value, the mathematical operation is being done across each row.

> Note from Jason: You may have noticed the `AS discount_amount` portion of the last query. This is a calculated column and is not saved data in the database. To have a descriptive name on this column, you can rename the resulting column in your query by writing `AS` and then whatever name you choose. If you want spaces, symbols, or capitalized letters in the name, you will have to format it with quotes: `AS "Discount Amount"`. If you don't format the name of the column with quotes then it can only be one word and cannot begin with a number. Throughout this course, most column names will not use quotes.

Mathematical operations can also be done in the `WHERE` clause, they aren't just limited to the `SELECT` statement.

Something like the example below is perfectly fine!

```sql
SELECT product_code,
 full_name
FROM example.products
WHERE (original_price - current_price) = 40;
```

The subtraction of the two fields was put in parentheses to show that the mathematical operation is clearly separate from the `=`. And remember from your old math classes in school: whatever is within the parentheses is calculated first!

> The data columns you are calculating are not displayed in the results. If you want to see those as well, add them to the column list after the `SELECT` (and remember the `,` (commas). You can also change the `40` to another amount to see how this changes the results displayed.
