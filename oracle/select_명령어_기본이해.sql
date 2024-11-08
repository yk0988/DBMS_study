SELECT EMPLOYEE_id, first_name, last_name
from EMPLOYEES;


--EMPLOYEE_id 기준으로 내림차순 정렬
SELECT EMPLOYEE_id, first_name, last_name
from EMPLOYEES
order by EMPLOYEE_id desc;


--잡_id 아이디 출력
SELECT DISTINCT job_id
from EMPLOYEES;


--1번 필드 사원번호/ 이름 /성으로 필드 변경(1)
SELECT EMPLOYEE_id as 사원번호 , first_name as 이름, last_name as 성
from EMPLOYEES;

--(2)
SELECT EMPLOYEE_id  사원번호 , first_name 이름, last_name 성
from EMPLOYEES;


---first_name + last_name 붙여서 출력(||)연결연산자
SELECT EMPLOYEE_id 사원번호, first_name||' '||last_name 사원이름
from EMPLOYEES;

--EMPLOYEES; 1)EMPLOYEE_id, 출력 
---          2)first_name + last_name 붙여서 출력(||)연결연산자
----         3)email출력 @company.com 문구 붙여서 추력
SELECT EMPLOYEE_id 사원번호, first_name||' '||last_name 사원이름 ,email||'@company.com'이메일
from EMPLOYEES;



