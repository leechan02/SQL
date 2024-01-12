### 🥯 DATE_FORMAT
The DATE_FORMAT() function formats a date as specified.<br>
  - **Syntax**
    ```SQL
    DATE_FORMAT(date, format)
    -- date(필수): 다시 출력할 date 데이터
    -- format(필수): 아래 여러 조합으로 출력할 수 있다.
    ```
    |Format|Description|
    |---|---|
    |%D|Day of the month as a numeric value (1st, 2nd, 3rd,...|
  - **Example**
    ```SQL
    SELECT ROUND(345.156, 0);
    -- result: 345
    ```
### 🌮 YEAR/MONTH/DAY
Returns the average value of an expression.<br>
  - **Syntax**
    ```SQL
    AVG(expression)
    -- expression(필수): 숫자, 필드, 공식이 될 수 있다.
    ```
  - **Example**
    ```SQL
    SELECT AVG(Price) AS AveragePrice FROM Products;
    ```
### 🥨 ORDER BY
Returns the average value of an expression.<br>
  - **Syntax**
    ```SQL
    AVG(expression)
    -- expression(필수): 숫자, 필드, 공식이 될 수 있다.
    ```
  - **Example**
    ```SQL
    SELECT AVG(Price) AS AveragePrice FROM Products;
    ```

### 🍕 Reference
[MySQL DATE_FORMAT() Function](https://www.w3schools.com/sql/func_mysql_date_format.asp) <br>
[MySQL YEAR() Function](https://www.w3schools.com/sql/func_mysql_year.asp)<br>
[MySQL MONTH() Function](https://www.w3schools.com/sql/func_mysql_month.asp)<br>
[MySQL DAY() Function](https://www.w3schools.com/sql/func_mysql_day.asp)<br>
