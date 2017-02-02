# Super-Subtype Entity Relationship

Make sure you have created your tables
using [this data definition language][2].

![enhanced entity relationship diagram][3]

To get all the loan accounts, and their details, you will need
a [`JOIN` statement][1] to select data from multiple tables.

```sql
SELECT *
FROM eerd_account
JOIN eerd_loan
  ON eerd_account.account_id = eerd_loan.account_id
```

![query results and execution plan for join statement][4]

Or you could just filter on the `account_type` if you're not interested in the details.
This query is much more efficient because it only uses one table,
and will run faster if the additional information is not necessary for your business question.

```sql
SELECT *
FROM eerd_account
WHERE account_type = 'L'
```

![query results and execution plan for one table with where clause][5]

[1]:http://www.w3schools.com/sql/sql_join.asp
[2]:./ddl.sql
[3]:./docs/images/eerd.png
[4]:./docs/images/join.png
[5]:./docs/images/where.png
