### 🥯 IS NOT NULL
Returns a specified value if the expression is NULL.<br>
  - **Syntax**
    ```SQL
    IFNULL(expression, alt_value)
    -- expression(필수): The expression to test whether is NULL
    -- alt_value(필수): The value to return if expression is NULL
    ```
  - **Example**
    ```SQL
    SELECT IFNULL(TLNO, 'NONE');
    -- TLNO 필드 값이 NULL이면 NONE 출력.
    ```
### 🌮 Alias
Used to give a table, or a column in a table, a temporary name.<br>
  - **Syntax**
    ```SQL
    SELECT column_name AS alias_name
    FROM table_name;
    ```
  - **Example**
    ```SQL
    SELECT CustomerID AS ID, CustomerName AS Customer
    FROM Customers;
    ```

### 🍕 Reference
[MySQL DATE_IFNULL() Function](https://www.w3schools.com/sql/func_mysql_ifnull.asp) <br>
[SQL Aliases](https://www.w3schools.com/sql/sql_alias.asp)<br>
