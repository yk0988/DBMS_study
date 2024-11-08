SELECT * FROM employees;

--where
SELECT * 
FROM employees
WHERE employee_id=100;


--first name이 David인 직원
SELECT * 
FROM employees
WHERE first_name = 'David'; --문자열 ''


--employees_id가 105인 직원
SELECT * 
FROM employees
WHERE employee_id >= 105;

--salary가 10,000 이상히고 20,000 이하인 직원 정보
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--salary가 10,000 / 17,000 / 24,000 인 직원 정보
SELECT *
FROM employees
WHERE salary IN(10000,17000,24000);

--jab_id가 AD로 시작하는 모든(%) 인 직원 정보
SELECT *
FROM employees
WHERE job_id LIKE 'AD%';

--AD로 시작하면서 뒤에 따라오는 문자열이 3자인 데이터
SELECT *
FROM employees
WHERE job_id LIKE 'AD___'; --언더바 3개



--manager_id가 null값인 직원
SELECT *
FROM employees
WHERE manager_id is NULL;




--salary가 4000을 초과하면서 job_id가 IT_PROG이거나 Fl_ACCOUNT인 경우
SELECT *
FROM employees
WHERE salary > 4000
AND job_id='IT_PROG'
or job_id='Fl_ACCOUNT';

--employee_id가 105가 아닌 직원만 출력
SELECT * 
FROM employees
WHERE employee_id <> 105;


--salary가 40000을 초과하면서 job_id가 IT_PROG 인 값 조회
SELECT *
FROM employees
WHERE salary > 4000
AND job_id='IT_PROG';


--last_name을 소문자와 대문자로 출력하고 email의 첫번째 문자는 대문자로 출력하라.
SELECT 
    last_name, 
    LOWER(last_name) AS lower적용, 
    UPPER(last_name) AS upper적용, 
    INITCAP(email) AS initcap적용 
FROM 
    employees;


--job_id 첫번쨰 자리부터 두개의 문자 출력(글자뺴기)
SELECT 
    job_id, 
    SUBSTR(job_id, 1, 2) AS 첫두자리 
FROM 
    employees;



--job_id 문자 값이 ACCOUNT라면 ACCNT로 출력(글자바꾸기)
SELECT 
    job_id, 
    REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM 
    employees;



--특정문자 채우기
--first name에 대해 12자리 문자열로 만들고 first name의 데이터 값이 12보다 작으면 왼쪽에서 부터 *를 채워서 출력
SELECT 
    first_name, 
    LPAD(first_name, 12, '*') AS 적용결과
FROM 
    employees;
    
    

--자르기 
--중간 공백을 제외한 나머지 공백 제거
--dual : 더미파일
--(1)
SELECT 
    '@tat'||'   -space-    '||'end'
FROM 
    dual;
    
--(2)    
SELECT 
    '@tat'||trim('   -space-    ')||'end'
FROM 
    dual;
    
 
--자리올림
--salsry를 30으로 나누고 나눈값의 소수점 첫째, 소수점 둘쨰  정수 첫자리에서 반올림한 값은?
SELECT 
    salary, 
    ROUND(salary / 30, 0) AS 반올림된값
FROM 
    employees;
    
    
SELECT salary,   
    salary/30, 
    ROUND(salary / 30, 0) 적용결과_0,
    ROUND(salary / 30, 1) 적용결과_1,
    ROUND(salary / 30, -1) 적용결과_마이너스1
FROM 
    employees;
    
    
--절삭
--salsry를 30으로 나누고 나눈값의 소수점 첫째, 소수점 둘쨰  정수 첫자리에서 절산하여 출력?
SELECT  salary, 
    salary/30 일급, 
    trunc(salary / 30, 0) 적용결과_0,
    trunc(salary / 30, 1) 적용결과_1,
    trunc(salary / 30, -1) 적용결과_마이너스1
FROM 
    employees;

--날짜 /오늘날짜/더하기1 뺴기1 특정날짜 빼기 시간더하기
SELECT 
    TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI') AS 오늘날짜,
    SYSDATE + 1 AS 더하기_1,
    SYSDATE - 1 AS 빼기_1,
    TO_DATE('20241205', 'YYYYMMDD') - TO_DATE('20021201', 'YYYYMMDD') AS 날짜_빼기,
    SYSDATE + (13/24) AS 시간더하기
FROM 
    dual;


--두 날짜 사이에 개월수 계산   department_id가 100인 직원에 대하 오늘날짜 hire_date,
--오늘날짜와 hire_date  사이의 개월 수 출력
SELECT 
    SYSDATE AS 오늘날짜, 
    hire_date, 
    MONTHS_BETWEEN(SYSDATE, hire_date) AS 적용결과
FROM 
    employees
WHERE 
    department_id = 100;


--월 날짜 더하기
--employees_id와 100 ~106 사이인 직원의 hire_date 에 3개월을 더한 값. hire_date 에 3개월을 뺸 값

SELECT 
    hire_date,
    ADD_MONTHS(hire_date, 3) AS 더하기_적용결과,
    ADD_MONTHS(hire_date, -3) AS 빼기_적용결과
FROM 
    employees
WHERE 
    employee_id BETWEEN 100 AND 106;
    
    
    
    -------------------------

SELECT 
    salary * commission_pct 
FROM 
    employees
ORDER BY 
    commission_pct;

--------------------------

--salsry commission_pct를 곱하되 commission_pct가 null일떄는 1로 치환하여 commission_pct를 곱한 결과를 출력.
SELECT 
    salary * NVL(commission_pct, 1) 결과
FROM 
    employees
ORDER BY 
    commission_pct;

--------------------------

--first_name,last_name,department_id,salary를 출력.
--department_id가 60인 경우 급여 10% 인상한 값을 계산하여 출력하고 나머지 경우에는 원래의 값을 출력.
--그리고 ,department_id가 60인 경우에는 '10% 인상' 출력하고 나머지 경우에는 '미인상'출력.
--DECODE

SELECT 
    first_name,
    last_name,  -- last_namem -> last_name으로 수정
    department_id,
    salary AS 원래_급여,
    DECODE(department_id, 60, salary * 1.1, salary) AS 조정급여_금액,  -- 조정급여에 대한 별칭 수정
    DECODE(department_id, 60, '10%인상', '미인상') AS 조정급여_상태  -- 별칭 변경
FROM 
    employees;
    
SELECT 
    first_name,
    last_name,  -- SQLINES DEMO *** t_name으로 수정
    department_id,
    salary AS 원래_급여,
    CASE department_id  WHEN 60 THEN  salary * 1.1  ELSE salary END AS 조정급여_금액,  -- SQLINES DEMO *** ��한 별칭 수정
    CASE department_id  WHEN 60 THEN  '10%인상'  ELSE '미인상' END AS 조정급여_상태  -- �... SQLINES DEMO ***
FROM 
    employees;
    