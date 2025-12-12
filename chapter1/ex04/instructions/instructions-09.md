<details>
<summary> <b>Want a hint?</b> </summary>
<ul>
     <li>Use the `ROUND` function to make sure your new column has only 2 decimal places. Refer back to the *Working with Decimals* portion of the **Math with SQL** lesson if you need a refresher on how to use the `ROUND` function.</li>
	  <li>You will need to multiply one field in your calculation by 1.00, otherwise a calculation of all integers will result in an integer. To calculate a percentage, take the calculation from your `discount_amount` column and divide it by the `original_amount`. Be careful of your parentheses!</li>
	</ul>

</details>
<br>
<details>
<summary> <b>Want another hint?</b> </summary>
<ul>
    <li>You cannot reference a calculated column name (like `discount_amount`) in the same query. Copy the calculation from the previous step.</li>
	</ul>
</details>
