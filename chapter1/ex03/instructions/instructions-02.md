When working with numerical fields, the decimal places are always going to be important.

With SQL, if you are performing mathematical operations on whole numbers (or fields with a data type of `integer`), the results will also be whole numbers. When you are dividing numbers to get something like a percentage, this is not always going to be what you want...

A trick to getting your results to have the correct number of decimal places is to multiply a field by **1**, along with the number of decimal places you want to see.

For example:

```sql
SELECT product_code,
 current_price,
 current_price*1.00
FROM example.products;
```

If you run that query, you will see that 2 decimal places were added to the value because the field was multiplied by a number with 2 decimal places.

Another more advanced option is to use a `ROUND` function. This function allows you to specify how many decimal places you want to see for a particular field or calculation.

Here's an example of rounding a field:

```sql
SELECT product_code,
current_price
ROUND(current_price,2)
FROM example.products;
```

And here is one of rounding a calculation (note the use of parentheses):

```sql
SELECT product_code,
 current_price,
 ROUND((current_price + original_price),3)
FROM example.products;
```