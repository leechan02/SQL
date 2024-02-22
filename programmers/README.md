# SQL
[SQL Reference](https://school.programmers.co.kr/learn/challenges?tab=sql_practice_kit)

## SQL 기본 문법

### SQL 키워드 대소문자

SQL 키워드는 대소문자를 구분하지 않는다.

→ `select`와 `SELECT`는 똑같다. (PostgreSQL은 구분함)

### 세미콜론

대부분의 DB 시스템에서 SQL문 마지막에 `;`을 써야한다.

### SQL 명령어

`SELECT` - DB에서 데이터 추출

`UPDATE` - DB에서 데이터 갱신

`DELETE` - DB에서 데이터 삭제

`INSERT INTO` - DB에 새 데이터 삽입

`CREATE DATABASE` - 새 DB 생성

`ALTER DATABASE` - DB 수정

`CREATE TABLE` - 새 Table 생성

`ALTER TABLE` - Table 수정

`DROP TABLE` - Table 삭제

`CREATE INDEX` - 인덱스 생성

`DROP INDEX` - 인덱스 삭제

## SQL 키워드

### SELECT

Database에서 데이터를 선택할 때 사용.

- **기본 문법**
    
    ```jsx
    SELECT column1, column2,...columnN 
    FROM table_name
    [WHERE]
    [GROUP BY]
    [HAVING]
    [ORDER BY column(s) [ASC|DESC]]
    ```
    
- **예시**
    
    ```jsx
    -- 한 줄 주석은 --을 사용하면 됩니다.
    
    SELECT CustomerName, City FROM Customers;
    -- Customers 테이블에서 CustomerName과 City 필드를 가져온다.
    
    SELECT * FROM Customer;
    -- *를 사용하면, 모든 필드를 가져올 수 있다.
    ```
    

### JOIN

2개 이상의 테이블로부터 관련있는 칼럼에 기반하여 행을 합쳐 일시적인 행들의 집합을 만듬

- 즉 `join`은 여러번이 사용 가능하다.
- **기본 문법**
    
    ```sql
    FROM table1
    join_type table2
    [ON (join_condition)]
    -- table1, table2 : 합칠 때 사용되는 테이블 (필수)
    -- join_type : join 타입 (필수)
    -- join_condition : 합칠 기준이 되는 조건문 (선택)
    --                  만약 생략되면 -> 곱집합(Cartesian product)을 구해 행의 길이가 방대해질 수 있다.
    ```
    
- **예시**
    
    ```sql
    -- Inner Join(교집합)
    SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
    FROM Orders
    INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
    
    -- 모든 Outer Join의 교집합이 아닌 행들은 합쳐질 것이 없기 때문에,
    --      추가된 값들은 모두 NULL이다.
    
    -- Left Outer Join(교집합 + 왼쪽 테이블의 남은 부분)
    SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
    FROM Orders
    LEFT OUTER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
    
    -- Left Outer Join(교집합 + 오른쪽 테이블의 남은 부분)
    SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
    FROM Orders
    RIGHT OUTER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
    
    -- Full Outer Join(교집합 + 왼쪽, 오른쪽 테이블의 남은 부분)
    SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
    FROM Orders
    FULL OUTER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
    
    ```
    

### WHERE

특정 조건을 만족하는 행(record)을 가져올 때 사용

- **기본 문법**
    
    ```sql
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition;
    ```
    
- **예시**
    
    ```sql
    SELECT * FROM Customers
    WHERE CustomerID > 80;
    -- 모든 열(column)을
    -- Cutomers 테이블에서 가져오는데
    -- CutomerID가 80보다 큰 행(row)을 가져온다.
    ```
    
- **함께 사용하는 여러 연산자**
    - **like 연산자**
        
        `WHERE`에서 특정 패턴을 찾을 때 사용된다.
        
        **기본 문법**
        
        ```sql
        SELECT column1, column2, ...
        FROM table_name
        WHERE columnN LIKE pattern;
        ```
        
        **예시**
        
        ```sql
        SELECT * FROM Customers
        WHERE city LIKE '%L%';
        -- 모든 열(column)을
        -- Cutomers 테이블에서 가져오는데
        -- city가 L을 포함하고 있는 행을 가져온다.
        -- 대소문자를 구분하고 싶으면 binary를 붙이면 된다. like binary '%L%'
        ```
        
        **정규식**
        
        `%` 0개 이상의 문자
        
        `_` 1개의 문자
        
    - **in 연산자**
        
        `where` 에서 여러 값을 찾을 때 사용
        
        - `or` 여러개를 줄인 것
        
        **기본문법**
        
        ```sql
        SELECT column_name(s)
        FROM table_name
        WHERE column_name IN (value1, value2, ...);
        ```
        
        **예시**
        
        ```sql
        SELECT * FROM Customers
        WHERE Country NOT IN ('Germany', 'France', 'UK');
        -- 모든 열(column)을
        -- Cutomers 테이블에서 가져오는데
        -- Country가 Germany 혹은 France 혹은 UK인 행을 가져온다.
        ```
        
    - **예시**
        
        ```sql
        WHERE CustomerID = 80
        -- 80이랑 같을 때 (equal)
        
        WHERE CustomerID > 80
        -- 80보다 클 때 (greater than)
        
        WHERE CustomerID < 80
        -- 80보다 작을 때 (less than)
        
        WHERE CustomerID >= 80
        -- 80이상일 때 (greater than or equal)
        
        WHERE CustomerID <= 80
        -- 80이하일 때 (less than or equal)
        
        WHERE CustomerID <> 80
        -- 80이랑 같지 않을 때 (not equal)
        -- 몇몇 버전의 SQL에서는 !=로 써질 수도 있다.
        
        WHERE CustomerID BETWEEN 70 AND 80
        -- 70 <= CustomerID <= 80
        
        WHERE City LIKE 's%'
        -- s로 시작하는
        
        WHERE City IN ('Paris','London')
        -- Paris 혹은 London인
        ```
        

### Wildcards

like와 함께 사용하는 연산자

- **예시**
    
    ```sql
    SELECT * FROM Customers
    WHERE CustomerName LIKE 'a%';
    ```
    
- **문자 종류**
    
    
    | Symbol | Description |
    | --- | --- |
    | % |  0개 이상의 문자를 대표 |
    | _ | 정확히 하나의 문자를 대표 |
    | [] | 괄호 내의 어떤 단일 문자와도 일치 |
    | ^ | 문자 집합의 부정을 나타냅니다(대괄호 [] 내에서 사용될 때). |
    | - | 문자 범위를 나타냄 |
    | {} | 특정 문자를 리터럴로 표현하거나, 반복 횟수를 지정할 때 사용 |
    
    ```sql
    SELECT * FROM Employees WHERE name LIKE 'Sam%';
    -- name이 "Sam"으로 시작하는 모든 직원을 찾습니다. 예를 들어, "Samuel", "Samantha" 등이 결과에 포함됩니다.
    SELECT * FROM Employees WHERE name LIKE 'Sam_';
    --  "Sam" 다음에 정확히 하나의 문자가 오는 이름을 가진 직원을 찾습니다. 예를 들어, "Samy"는 결과에 포함되지만, "Samantha"는 포함되지 않습니다.
    
    ```
    

### GROUP BY

같은 값을 가지고 있는 행을 묶는다.

- 주로, 집계 합수(`COUNT()`, `MAX()`, `MIN()`, `SUM()`, `AVG()`, …)와 많이 쓰인다.
- **기본 문법**
    
    ```sql
    SELECT column_name(s)
    FROM table_name
    GROUP BY column_name(s);
    ```
    
- **예시**
    
    ```sql
    SELECT COUNT(CustomerID), Country
    FROM Customers
    GROUP BY Country
    ORDER BY COUNT(CustomerID) DESC;
    -- Cutomers 테이블에서
    -- Country가 같은 행을 묶어서
    -- CustomerID의 개수와 Country를 가져온다.
    -- CustomerID 개수 내림차순으로
    ```
    

### HAVING

집계 함수를 `WHERE`에서 사용할 수 없기 때문에 만들어졌다.

- `WHERE` → 행별 필요한 데이터 (select에 있는 as 사용 불가능)
- `HAVING` → 그룹별(만약에 `GROUP BY` 가 없으면, 현재 잡힌 모든 행이 그룹이 된다.) 필요한 데이터 (select에 있는 as 사용 가능)
- **기본 문법**
    
    ```sql
    SELECT column_name(s)
    FROM table_name
    HAVING condition;
    ```
    
- **예시**
    
    ```sql
    SELECT COUNT(CustomerID), Country
    FROM Customers
    GROUP BY Country
    HAVING COUNT(CustomerID) > 5
    ORDER BY COUNT(CustomerID) DESC;
    -- Cutomers 테이블에서
    -- Country가 같은 행을 묶어서
    -- CustomerID의 개수가 5보다 큰
    -- CustomerID의 개수와 Country를 가져온다.
    -- CustomerID 개수 내림차순으로
    ```
    

### ORDER BY

결과를 내림차순/오름차순으로 정렬할 때 사용

- **기본 문법**
    
    ```sql
    SELECT column1, column2, ...
    FROM table_name
    ORDER BY column1, column2, ... ASC|DESC;
    -- ASC은 ascending(오름차순)의 약자고,
    -- DESC은 descending(내림차순)의 약자다.
    -- |는 '또는'이라는 뜻이다 -> ASC 혹은 DESC을 사용할 수 있다.
    ```
    
- **예시**
    
    ```sql
    SELECT * FROM Products
    ORDER BY ProductName DESC;
    -- ProductName을 기준으로 내림차순 정렬
    ```
    

### LIMIT

제한된 개수만 출력

- **기본 문법**
    
    ```sql
    SELECT column_name(s)
    FROM table_name
    WHERE condition
    LIMIT number;
    ```
    
- **예시**
    
    ```sql
    SELECT * FROM Customers
    LIMIT 3;
    ```
    

### WITH (Common Table Expressions)

이름이 지정된 일시적인 결과 집합

- **기본 문법**
    
    ```sql
    WITH [RECURSIVE]
    	cte_name [(col_name [, col_name] ...)] AS (subquery)
    	[, cte_name [(col_name [, col_name] ...)] AS (subquery)] ...
    ```
    
    **CTE 칼럼명 정하기**
    
    - 칼럼명 개수는 실제 결과 집합의 칼럼 개수랑 똑같아야 한다.
    
    ```sql
    -- WITH 문에서 칼럼명 정하기 --
    WITH cte (col1, col2) AS
    (
      SELECT 1, 2
      UNION ALL
      SELECT 3, 4
    )
    
    SELECT col1, col2
    	FROM cte;
    
    -- 첫 번째 SELECT문에서 AS로 칼럼명 만들기 --
    WITH cte AS
    (
      SELECT 1 AS col1, 2 AS col2
      UNION ALL
      SELECT 3, 4
    )
    
    SELECT col1, col2
    	FROM cte;
    ```
    
    **with 사용 가능 위치**
    
    ```sql
    -- SELECT, UPDATE, DELETE 앞에 사용 --
    WITH ... SELECT ...
    WITH ... UPDATE ...
    WITH ... DELETE ...
    
    -- subquery 앞에 사용 (어라라, Subquery와 CTE를 합친... 제일 강력한 게 아닌가?) --
    SELECT ... WHERE id IN (WITH ... SELECT ...) ...
    SELECT * FROM (WITH ... SELECT ...) AS dt ...
    
    -- SELECT 문 앞에서 사용 --
    INSERT ... WITH ... SELECT ...
    REPLACE ... WITH ... SELECT ...
    CREATE TABLE ... WITH ... SELECT ...
    CREATE VIEW ... WITH ... SELECT ...
    DECLARE CURSOR ... WITH ... SELECT ...
    EXPLAIN ... WITH ... SELECT ...
    ```
    
    **재귀적으로 사용**
    
    재귀적으로 사용할 때는 `WITH RECURSIVE`를 사용.
    
    ```sql
    -- 재귀 CTE는 UNION을 기준으로 두 부분으로 나눠진다. --
    SELECT ...      -- return initial row set
    UNION ALL
    SELECT ...      -- return additional row sets
    
    -- 재귀 예시 --
    WITH RECURSIVE cte (n) AS
    (
      SELECT 1
      UNION ALL
      SELECT n + 1
    		FROM cte
    		WHERE n < 5
    )
    
    SELECT *
    	FROM cte;
    
    -- 결과값 --
    /*
    +------+
    | n    |
    +------+
    |    1 |
    |    2 |
    |    3 |
    |    4 |
    |    5 |
    +------+
    */
    
    -- CTE 재귀 깊이 정하기 --
    --   기본 최대 깊이는 1000
    SET SESSION cte_max_recursion_depth = 10;      -- permit only shallow recursion
    SET SESSION cte_max_recursion_depth = 1000000; -- permit deeper recursion
    
    -- Fibonacci 수열을 CTE로 만들기 --
    WITH RECURSIVE fibonacci (n, fib_n, next_fib_n) AS
    (
    	SELECT 1, 0, 1
    	UNION ALL
    	SELECT n + 1, next_fib_n, fib_n + next_fib_n
    		FROM fibonacci
    		WHERE n < 10
    )
    
    SELECT *
    	FROM fibonacci
    
    /*
    +------+-------+------------+
    | n    | fib_n | next_fib_n |
    +------+-------+------------+
    |    1 |     0 |          1 |
    |    2 |     1 |          1 |
    |    3 |     1 |          2 |
    |    4 |     2 |          3 |
    |    5 |     3 |          5 |
    |    6 |     5 |          8 |
    |    7 |     8 |         13 |
    |    8 |    13 |         21 |
    |    9 |    21 |         34 |
    |   10 |    34 |         55 |
    +------+-------+------------+
    */
    ```
    

### CASE

조건문을 거쳐서 첫 번째로 조건문이 참이 될 때 그 조건문에 해당하는 값을 반환

- **기본 문법**
    
    ```sql
    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        WHEN conditionN THEN resultN
        ELSE result
    END;
    -- ELSE는 생략 가능
    -- ELSE가 없다면 NULL을 반환
    ```
    
- **예시**
    
    ```sql
    SELECT OrderID, Quantity,
    CASE
        WHEN Quantity > 30 THEN 'The quantity is greater than 30'
        WHEN Quantity = 30 THEN 'The quantity is 30'
        ELSE 'The quantity is under 30'
    END AS QuantityText
    FROM OrderDetails;
    ```
    
    ```sql
    
    SELECT CustomerName, City, Country
    FROM Customers
    ORDER BY
    (CASE
        WHEN City IS NULL THEN Country
        ELSE City
    END);
    ```
    

### UNION

2개 이상의 `SELECT`문의 결과를 합칠 때 사용.

- 기본적으로 `DISTINCT` 가 붙어 중복된 값은 제외한다. (모든 값을 구하고 싶다면 `ALL`)

**조건**

모든 `select` 문은 칼럼 개수와 칼럼 순서가 똑같아야 하고 각 순서에 해당하는 칼럼의 타입이 같거나 호환가능한 타입이어야 한다.

- **기본 문법**
    
    ```sql
    SELECT <column_list>t [INTO ]
    [FROM ]  	[WHERE ]
    [GROUP BY ]  	[HAVING ]
    [UNION [ALL]
    SELECT <column_list>
    [FROM ]  	[WHERE ]
    [GROUP BY ]  	[HAVING ]...]
    [ORDER BY ]
    ```
    
- **예시**
    
    ```sql
    SELECT DATE_FORMAT(SALES_DATE, "%Y-%m-%d") AS SALES_DATE,
            PRODUCT_ID, USER_ID, SALES_AMOUNT
        FROM ONLINE_SALE
        WHERE YEAR(SALES_DATE) = 2022
            AND MONTH(SALES_DATE) = 3
    UNION
    SELECT DATE_FORMAT(SALES_DATE, "%Y-%m-%d") AS SALES_DATE,
            PRODUCT_ID, NULL AS USER_ID, SALES_AMOUNT
        FROM OFFLINE_SALE
        WHERE YEAR(SALES_DATE) = 2022
            AND MONTH(SALES_DATE) = 3
    ORDER BY SALES_DATE, PRODUCT_ID, USER_ID;
    ```
    

### DISTINCT

중복된 값을 제외하고 반환

- **기본 문법**
    
    ```sql
    SELECT DISTINCT column1, column2, ...
    FROM table_name;
    ```
    
- **예시**
    
    ```sql
    SELECT DISTINCT Country FROM Customers;
    -- 중복된 값을 제외한 Country 값 반환
    
    SELECT COUNT(DISTINCT Country) FROM Customers;
    -- 중복된 값을 제외하고 count를 한다.
    -- Microsoft Access databases에서는 지원하지 않는다.
    ```
    

### ALIAS

테이블 혹은 칼럼에 일시적인 이름을 줄 때 사용.

- 주로, 칼럼을 읽기 좋게 만들 때 사용.

**사용범위**

- 별칭이 만들어진 질의에서만 존재.
- **기본문법**
    
    ```sql
    -- 칼럼에 사용할 때
    SELECT column_name AS alias_name
    FROM table_name;
    
    -- 테이블에 사용할 때
    SELECT column_name(s)
    FROM table_name AS alias_name;
    ```
    
- **예시**
    
    ```sql
    -- 칼럼에 사용할 때
    SELECT CustomerID AS ID, CustomerName AS Customer
    FROM Customers;
    
    -- 테이블에 사용할 때
    SELECT o.OrderID, o.OrderDate, c.CustomerName
    FROM Customers AS c, Orders AS o
    WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;
    ```
    

### IS NULL

NULL값을 확인할 대 사용하는 키워드

- **예시**
    
    ```sql
    SELECT CustomerName, ContactName, Address
    FROM Customers
    WHERE Address IS NULL;
    -- Cutomers 테이블에서
    -- CustomerName, ContactName, Address를 가져오는데
    -- Address가 NULL값인
    ```
    

## MYSQL 함수들

### 문자 관련 함수

**CONCAT(*expression1*, *expression2*, *expression3*,...)**

- 문자열 합쳐서 반환
    
    ```sql
    SELECT CustomerName, CONCAT(Address, " ", PostalCode, " ", City) AS Address
    FROM Customers;
    
    -- CustomerName	        Address
    -- Alfreds Futterkiste	Obere Str. 57 12209 Berlin
    ```
    

**CONCAT_WS(*separator*, *expression1*, *expression2*, *expression3*,...)**

- 문자열 사이 separator를 넣어서 합쳐 반환
    
    ```sql
    SELECT CustomerName, CONCAT_WS("-", Address, PostalCode, City) AS Address
    FROM Customers;
    
    -- CustomerName	        Address
    -- Alfreds Futterkiste	Obere Str.-57 12209-Berlin
    ```
    

**SUBSTR(*string*, *start*, *length*)**

- 문자열 추출
    
    ```sql
    SELECT SUBSTR(CustomerName, 2, 5) AS ExtractString
    FROM Customers;
    ```
    

**REPLACE(*string*, *from_string*, *new_string*)**

- 문자열 변환
    
    ```sql
    SELECT REPLACE("XYZ FGH XYZ", "X", "M");
    ```
    

**REVERSE(*string*)**

- 문자열 전환
    
    ```sql
    SELECT REVERSE(CustomerName)
    FROM Customers;
    ```
    

**UCASE(*text*)**

- 대문자 변환
    
    ```sql
    SELECT UCASE("SQL Tutorial is FUN!");
    ```
    

**LCASE(*text*)**

- 소문자 변환
    
    ```sql
    SELECT LCASE("SQL Tutorial is FUN!");
    ```
    

**LENGTH(*string*)**

- 문자열 길이 리턴
    
    ```sql
    SELECT LENGTH("SQL Tutorial") AS LengthOfString;
    ```
    

**TRIM(*string*)**

- 앞과 끝에 있는 공백 제거
    
    ```sql
    SELECT TRIM('    SQL Tutorial    ') AS TrimmedString;
    ```
    

### 숫자 관련 함수

**ROUND(*number*, *decimals*)**

- number을 denimals자리까지 반올림, decimals 생략시 소수점 위로 반올림
    
    *number(필수): 반올림될 숫자*
    
    *decimals(옵션): 반올림될 소수점 자리*
    
    ```sql
    SELECT ProductName, Price, ROUND(Price, 1) AS RoundedPrice
    FROM Products;
    ```
    

**CEIL(*number*)**

- 소수점을 올림한 정수 반환
    
    ```sql
    SELECT CEIL(25.75);
    -- 26 return
    ```
    

**FLOOR(*number*)**

- 소수점을 내림한 정수를 반환
    
    ```sql
    SELECT FLOOR(25.75);
    -- 25
    ```
    

**GREATEST(*arg1*, *arg2*, *arg3*, ...)**

- 제일 큰 수 반환
    
    ```sql
    SELECT GREATEST(3, 12, 34, 8, 25);
    -- 34
    ```
    

**LEAST(*arg1*, *arg2*, *arg3*, ...)**

- **제일 작은 수 반환**
    
    ```sql
    SELECT LEAST(3, 12, 34, 8, 25);
    -- 3
    ```
    

**TRUNCATE(*number*, *decimals*)**

- 원하는 소수점 자리까지 출력
    
    ```sql
    SELECT TRUNCATE(135.375, 2);
    -- 135.37
    ```
    

**POW(*x*, y)**

- 제곱 수 반환
    
    ```sql
    SELECT POW(4, 2);
    -- 16
    ```
    

**SQRT(*number*)**

- 제곱근 반환
    
    ```sql
    SELECT SQRT(64);
    -- 8
    ```
    

**ABS(*number*)**

- 절대값 반환
    
    ```sql
    SELECT ABS(-243.5);
    ```
    

### 날짜 관련 함수

**DATE_FORMAT(*date*, *format*)**

- 원하는 형식으로 날짜를 표현
    
    *date(필수): 날짜*
    
    *format(필수): 원하는 형식*
    
    ```sql
    SELECT DATE_FORMAT(BIRTHDAY, '%Y-%m-%d')
    	FROM STUDENTS;
    -- BIRTHDAY를 %Y-%m-%d 형식으로 출력
    -- ex) 2022-02-15
    ```
    
    | 형식 | 설명 |
    | --- | --- |
    | %a | 요일 줄임말 (Sun~Sat) |
    | %D | 일(서수) (1st, 2nd, 3rd, …) |
    | %d | 일(두 자리 숫자) (01~31) |
    | %b | 월(문자) 줄임말(Jan~Dec) |
    | %c | 월(숫자) (0~12) |
    | %m | 월(숫자) (00~12) |
    | %Y | 4자리 연도 (ex : 2023) |
    | %T | 시간 (hh:mm:ss) |
    | %S | 초 (00~59) |
    | %i | 분 (00~59) |
    | %H | 시간(두 자리 숫자) (00~23) |

**year/month/day**

- 각각 날짜에서 연도, 월, 일을 추출하는 함수
    
    ```sql
    SELECT NAME FROM FRIENDS
    	WHERE MONTH(BIRTH_DATE) = 2
    		AND DAY(BIRTH_DATE) = 29
    -- FRIENDS 테이블에서
    -- BIRTH_DATE가 2월 29일인
    -- NAME을 가져온다.
    ```
    

**DATEDIFF(*date1*, *date2*)**

- 두 date 사이의 일수를 반환
    
    ```sql
    SELECT DATEDIFF('2023-12-05', '2023-12-01');
    -- 4가 나온다.
    
    SELECT DATEDIFF('2023-12-01', '2023-12-05');
    -- -4가 나온다.
    ```
    

### advanced 함수

**IFNULL(*expression*, *alt_value*)**

- 만약에 값이 NULL이면 → 대신 반환할 값을 설정할 수 있다.
    
    ```sql
    SELECT ProductName, IFNULL(UnitsOnOrder, 0)
    FROM Products;
    -- Products 테이블에서
    -- ProductName과 UnitsOnOrder 열을 가져오는데
    -- UnitsOnOrder값이 NULL이면 0으로 출력
    ```
    

**IF(*condition*, *value_if_true*, *value_if_false*)**

- condition이 true면 value true, value false
    
    ```sql
    SELECT IF(500<1000, "YES", "NO");
    -- YES
    ```
    

### 집계 함수

테이블 혹은 그룹에 집계한 값을 반환

- 기본적으로 `NULL`값은 집계하지 않는다.
- **기본 문법**
    
    ```sql
    aggregate_function( [ DISTINCT | ALL ] expression)
    
    -- all 모든 값 깁계
    -- distinct 중복 값 제외
    ```
    

**MAX/MIN**

- 각각 칼럼의 최댓값/최솟값을 반환하는 함수
    
    ```sql
    -- MAX
    SELECT MAX(column_name)
    FROM table_name
    WHERE condition;
    
    -- MIN
    SELECT MIN(column_name)
    FROM table_name
    WHERE condition;
    ```
    

**COUNT**

- 행의 개수를 반환하는 함수
    
    ```sql
    -- Products 테이블 행의 개수.
    SELECT COUNT(*)
    FROM Products;
    
    -- Products 테이블의
    --   ProductName 칼럼 행의 개수.(NULL인 행은 제외)
    SELECT COUNT(ProductName)
    FROM Products;
    
    -- Products 테이블의
    --   중복값이 제외된 Price 칼럼 행의 개수 
    SELECT COUNT(DISTINCT Price)
    FROM Products;
    ```
    

**AVG**

- 값이 숫자인 칼럼의 평균값을 반환
    
    ```sql
    -- Alias와 함께 사용하는 예시.
    SELECT AVG(Price) AS `average price`
    FROM Products;
    
    -- 평균보다 높은 걸 잡고 싶을 때.
    --  서브 쿼리에 AVG 함수를 사용해 구할 수 있다.
    SELECT * FROM Products
    WHERE price > (SELECT AVG(price) FROM Products);
    
    -- null은 무시된다.
    ```
    

**SUM**

- 값이 숫자인 칼럼의 총 합계을 반환
    
    ```sql
    SELECT SUM(column_name)
    FROM table_name;
    -- null은 무시된다.
    ```
