<details>
<summary> <b>Want a hint?</b> </summary>

The `final_total` field is equivalent to `total` minus `discount_amount` plus `tax_amount`. Remember that math can be done in the `WHERE` clause and that "not equal to" is represented by `<>`.

</details>
<br>
<details>
<summary> <b>Want another hint?</b> </summary>

You are checking to see if `final_total <> total-discount_amount+tax_amount`.

</details>
