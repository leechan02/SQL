# SQL

### 📦 SQL(Structured Query Langauge)란?
관계형 데이터베이스에서 데이터를 저장, 관리, 조회하기 위한 표준 언어이다. <br>
SQL 구문은 크게 `DDL`, `DML`, `DCL` 3가지로 나뉜다.
|속성|설명|예시|
|---|---|---|
|DDL|DB에 테이블을 생성, 삭제, 변경하기 위한 명령어|CREATE, ALTER, DROP|
|DML|DB에 저장된 데이터를 처리, 조회, 검색하기 위한 명령어|SELECT, UPDATE, DELETE|
|DCL|DB에 저장된 데이터 관리를 위해 보안성, 무결성 등을 제어하기 위한 명령어|GRANT, REVOKE|
> SQL은 ANS/ISO 표준이지만, MySQL, Oracle, PostgreSQL.. 등 다양한 종류가 존재한다.

### 🧬 관계형 데이터 베이스
관계형 데이터베이스는 `테이블(table)`로 이루어진 DB 종류를 말한다. <br>
테이블은 `key`와 `value`의 관계를 나타낸다.
> 마치 엑셀 스프레드시트와 같은 표 형태.

### 🖋 SQL 작성
  - #### SQL 명령어 대소문자 <br>
    SQL 명령어는 대소문자를 구분하지 않는다. <br>
    `SELECT`와 `select`는 모두 허용된다. <br>
  - #### 세미콜론 <br>
    일부 DB 시스템에서는 각 SQL 문 끝에 세미콜론을 입력해야만 정상적으로 작동한다. <br>
    모든 문장이 아닌, SQL 문이 종료되는 곳에 세미콜론 하나를 작성한다. <br>
  - #### SQL문 작성 순서
    1. SELECT & DISTINCT
    2. FROM
    3. JOIN
    4. WHERE
    5. HAVING
    6. GROUP BY
    7. ORDER BY
    8. LIMIT

### 📖 공부하는 방법
[Programmers SQL 고득점 kit](https://school.programmers.co.kr/learn/challenges?tab=sql_practice_kit), [HackerRank SQL](https://www.hackerrank.com/domains/sql?badge_type=sql) 풀면서 개념정리

### 📚 Reference
[SQL Intro](https://www.w3schools.com/sql/sql_intro.asp) <br>
[SQL 기본문법](https://prd-space.tistory.com/3)
