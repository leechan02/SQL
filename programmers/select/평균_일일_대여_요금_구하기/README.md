### 🥯 ROUND
숫자를 특정 소수점 자리까지 반올림한다.<br>
  - **Syntax**
    ```SQL
    ROUND(number, deciamls)
    -- number(필수): 반올림 될 숫자
    -- deciaml(옵션): 반올림될 수수점 자리
    ```
  - **Example**
    ```SQL
    SELECT ROUND(345.156, 0);
    -- result: 345
    ```
### 🌮 AVG
지정된 값의 평균을 도출한다.<br>
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
[MySQL AVG() Function](https://www.w3schools.com/sql/func_mysql_avg.asp) <br>
[MySQL ROUND() Function](https://www.w3schools.com/sql/func_mysql_round.asp)<br>
