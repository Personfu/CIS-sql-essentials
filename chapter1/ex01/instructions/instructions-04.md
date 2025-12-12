In the exercises for this course, we will use datasets from fictional companies to help us learn and internalize the topics in each lesson. For many of the exercises, a fictional online retail company called Monday Boots will be the source of the situation you are provided with. The schema for the database tables associated with Monday Boots is named `retail`. For other exercises, data from a fictional software-as-a-service (SaaS) company will be used. These exercises will use the software schema. In each exercise, you will be told which schema to use in your SQL query.

Monday Boots:

- retail.inventory
- retail.orders
- retail.payments
- retail.products

SaaS (Software-as-a-Service:

- software.subscriptions
- software.plans

## Wording for Table Models

These are the tables being used in this course. Note that they are divided into different schemas with a schema associated with different companies. These tables are listing the first row of each of the tables. Some of the tables have a lot of columns and others just a few.

Example:

### `software.plans`

| plan_id | plan_type | plan_length | price |
| ------- | --------- | ----------- | ----- |
| 1       | basic     | 30          | 24    |

### `software.subscriptions`

| subscription_id | user_id | order_id | created_at    | updated_at    | plan_id | plan_type    | starts_on     | ends_on       | status | cancelled_at |
| --------------- | ------- | -------- | ------------- | ------------- | ------- | ------------ | ------------- | ------------- | ------ | ------------ |
| 78406818        | 25623   | 76452761 | 1/1/2018 0:36 | 1/1/2019 0:36 | 4       | premium_year | 1/1/2018 0:36 | 1/1/2019 0:36 | active |

# The Situation:

Someone from the Merchandising team at Monday Boots comes to you in a panic because their laptop just crashed and they lost all their files that track the inventory levels of all the items for sale on the website. It's your turn to save the day and provide them the data that they need!