## 🍳 SELECT
`SELECT` statement is used to select data from a database.

### 🥞 Syntax
``` MySQL
SELECT column1, column2, ...
FROM table_name
[WHERE]
[GROUP BY]
[HAVING]
[ORDER BY column(s) [ASC|DESC]];
```
**column**: `field names` of the table you want to select data from. <br>
**table_name**: the name of the `table` you want to select data from. <br>

### 🍔 Example
```MySQL
SELECT CustomerName, City FROM Customers;
-- CustomerName과 City 필드를 Customers 테이블에서 가져온다.

SELECT * FROM Customers;
-- *를 사용하면 Customers 테이블에 있는 모든 필드를 가져온다.
```

### 🍕 Reference
[SELECT Statement](https://www.w3schools.com/sql/sql_select.asp)
