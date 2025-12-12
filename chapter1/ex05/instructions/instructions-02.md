Let's take a quick detour here from logical operators and go over some information on dates...

In nearly every database you will likely encounter, dates are stored in the following format:

`YYYY-MM-DD`

This translates as: **year-month-day**.

> Note from Jason: Formatting dates in this way is standard across relational databases. I have never seen them represented in any other way.

When you have dates that contain the time, or **timestamps**, they will be represented like so:

`YYYY-MM-DD HH:MM:SS`

This translates as: **year-month-day hour:minute:second**.

Timestamps will usually have a 0-23 hour range.

When specifying a date in a PostgreSQL query, it is surrounded by single quotes on each end: `'2018-05-18 16:12:48'`. Other relational database systems may require the same or a different format.

Now that you know how to handle dates, let's move on to the first exercise for logical operators!
