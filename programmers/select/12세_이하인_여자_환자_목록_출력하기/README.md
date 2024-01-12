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
    |%d|Day of the month as a numeric value (01 to 31)|
    |%b|Abbreviated month name (Jan to Dec)|
    |%c|Numeric month name (0 to 12)|
    |%m|Month name as a numeric value (00 to 12)|
    |%Y|Year as a numeric, 4-digit value|
    |%T|Time in 24 hour format(hh:mm:ss)|
    |%S|Seconds (00 to 59)|
    |%i|Minutes(00 to 59)|
    |%H|Hour (00 to 23)|
  - **Example**
    ```SQL
    SELECT DATE_FORMAT (BirthDate, "%Y %m %d")
      FROM Employees;
    -- Employees 테이블에서 BirthDate를 "%Y %m %d" 형식으로 출력
    -- ex) 2007 08 08
    ```
### 🌮 YEAR/MONTH/DAY
Returns the year, month, day part for a given date.<br>
  - **Syntax**
    ```SQL
    YEAR(date)
    -- date(필수): date의 연도 반환
    MONTH(date)
    -- date(필수): date의 월 반환
    DAY(date)
    -- date(필수): date의 일 반환
    ```
  - **Example**
    ```SQL
    SELECT NAME FROM FRIENDS
	    WHERE MONTH(BIRTH_DATE) = 2
		  AND DAY(BIRTH_DATE) = 29
    -- FRIENDS 테이블에서 BIRTH_DATE가 2월 이고 29일인 NAME을 가져온다.
    ```
### 🥨 ORDER BY
Used to sort the result-set in ascending or descending order.<br>
  - **Syntax**
    ```SQL
    SELECT column1, column2, ...
    FROM table_name
    ORDER BY column1, column2, ... ASC|DESC;
    ```
  - **Example**
    ```SQL
    SELECT * FROM Products
    ORDER BY ProductName;
    -- ProductName 기준 알파벳 순서로 정렬.
    ```

### 🍕 Reference
[MySQL DATE_FORMAT() Function](https://www.w3schools.com/sql/func_mysql_date_format.asp) <br>
[MySQL YEAR() Function](https://www.w3schools.com/sql/func_mysql_year.asp)<br>
[MySQL MONTH() Function](https://www.w3schools.com/sql/func_mysql_month.asp)<br>
[MySQL DAY() Function](https://www.w3schools.com/sql/func_mysql_day.asp)<br>
[SQL ORDER BY Keyword](https://www.w3schools.com/sql/sql_orderby.asp)
