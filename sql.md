

```sql
sqlplus / as sysdba -> connect 
alter user hr account unlock; // 관리자 권한
alter user hr identified by hr; //password hr
connect hr/hr
```

- DBMS : 데이터를 관리하고 수정하는 프로그램 

   - 관계형 DB : col ,row 
   - entity 관계 

  memory 

  disk

  oracle_sid = oracle instance (XE)

  #### 2장  select 문 사용하여 데이터 검색

  - null 값 -> sql puls에서는 보이지 x

    공백이나 0이랑은 다름 

  - 문자열의 null 결합 -> 문자열로 

  - 머리글 alias 사용하기

  ```sql
  select last_name AS name , commission_pct comm from employees;
  
  select last_name "Name" ,salary*12 "annual salary" from employees;
  ```

  * 연결 연산자 사용 ||

  ```sql
  select last_name||job_id AS "EMOLOYEES" from employess;
  ```

  - 리터럴 문자열 

  ``` sql
  select last_name || ' is a ' || job_id AS "Employeess details" from employess;
  ```

  - 대체 인용 (q) 연산자 

  ```sql
  SELECT department_name ||q'[ Department's Manager id:]' || manager_id 
  as "department and manager" from departments;
  ```

  - 중복행 

  ```sql
  select distinct department_id from employees;
  ```

  - 테이블 구조

  ```sql
  describe employees;
  ```

#### 3장 데이터 제한 및 정렬

- 선택되는 행 제한

  - where 절 사용

    ```SQL
        select employee_id, last_name, job_id, department_id from employees where department_id =90;
    ```

- 문자열 및 날짜 -> 작은 따옴표 사용 

  날짜 YY-MON-DD

  ```sql
  Select last_name from employess where hire_date='17-OCT-03';
  ```

- 비교연산자

  - between

  - IN 연산자 

    ```SQL
    Select employee_id, last_name, salary, manager_id from employees where manager_id IN (100,101,201);
    ```

  - Like 연산자 사용 

    ```sql
    where first_name Like 's%'; //s 로 시작
    ```

  - % 는 0개 이상의 임의 문자 시퀀스르 나타냄

    ```sql
    select last_name, hire_date from employees where hire_date Like '%05'; -> 05 년도 1월 ~12 월 데이터	
    ```

  - null 조건 사용 

    - AND 연산자 사용 : 두 구성요소 조건이 모두 참
    - OR 연산자 사용  두 구성요소중 하나가 참
    - NOT 연산자 사용  NOT_IN ('IT_PROG', 'ST_CLERK');

  - ORDER BY 절 사용 

    - ASC 오름차순
    - DESC 내림차순 

    ```sql
    SELECT employeee_id, first_name from employees order by employee_id FETCH FIRST 5 ROWS ONLY;
    ```

  - SQL 행 제한절

    - row_limiting_clause 사용
    - Top-N  query 는 결과 집합 정렬후 n 행만 반환
    - FETCH FIRST  -백분율 지정
    - OFFSET 사용 결과집합의 첫행 다음에 있는 행으로 시작지정
    - WITH TILES 함께 order by 절 지정

  - 치환변수 사용하여 데이터 범위 제한

    - & ,&& 사용하여 값을 임시로 저장
    - 보완
      - WHERE
      - ORDER BY
      - 열 표현식 
      - 테이블 이름 
      - 전체 SELECT 문

    ```sql
    SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID =&employee_num;
    SELECT * FROM EMPLOYEES WHERE &condition
    ```

    && 치환변수 사용 -> 변수값 재사용

    ```
    SELECT employee_id, last_name, job_id, &&column_name
    FROM employees
    ORDER BY &column_name ;
    ```

  - DEFINE 명령어 사용

    - DEFINE 명령어 사용하여 변수를 생성하고 값을 할당
    - UNDEFINE  변수 제거

  - VERIFY 명령어 

  ```sql
  c_T가 포함된 문자열 검색
  	WHERE last_name Like '%c\_t' escape '\';
  ```

  
