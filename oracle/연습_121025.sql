SELECT salary 
FROM employees
WHERE last_name = 'De Haan';

SELECT *
FROM employees A
WHERE A.salary = 17000;

SELECT *
FROM employees A
WHERE A.salary = (SELECT salary 
                  FROM employees
                  WHERE last_name = 'De Haan'
                  
                  );


--IN  다중행 서브쿼리(결과가 두개 이상인 조건)

SELECT *
FROM employees A
WHERE A.salary in (
                SELECT salary 
                 FROM employees
                 WHERE last_name ='Taylor'
);
---------------------------------------------
                SELECT salary 
                 FROM employees
                 WHERE last_name ='Taylor';
---------------------------------------------

--employees 테이블에서 DEPARTMENT_ID 별로 가장낮은 salary 찾고 해당되는 직원이 누구인지 찾기

SELECT MIN(salary)
FROM employees
GROUP BY department_id;

SELECT *
FROM employees A
WHERE A.salary in(
                SELECT MIN(salary)
                FROM employees
                GROUP BY department_id
)
ORDER BY A.salary DESC;

-------다중열 사용
--잡 아이디 별로 

SELECT job_id, min(salary) 그룹별급여
FROM employees
GROUP BY job_id;

SELECT *
FROM employees A
WHERE (A.job_id, A.salary) IN (
    SELECT job_id, MIN(salary)
    FROM employees
    GROUP BY job_id
)
ORDER BY A.salary DESC;


-----인라인뷰(가상뷰) from 절 서브
--직원중에 직원 이름이 아이티인 직원 정보를 인라인 뷰를 이용해 출력

SELECT *
FROM employees A,
(
    SELECT department_id
    FROM departments
    WHERE department_name = 'IT'
) B
WHERE A.department_id = B.department_id;
          
          
----departments 테이블 department_name 'Sample_Dept'삭제
DELETE FROM departments
WHERE department_name = 'Sample_Dept';

rollback;
rollback;
rollback;
rollback;
rollback;
rollback;

CREATE TABLE sample_product(
product_id number,
product_name varchar2(30),
memu_date date
);
----테이블지우기
DROP TABLE sample_product;
------테이블생성
CREATE TABLE sample_product(
product_id number PRIMARY key,
product_name varchar2(30)not null,
memu_date date not null
);
--------------테이블 전체보기----
SELECT*from sample_product;

----------------테이블 행 추가--------
insert into sample_product VALUES(1,'tv',to_date('241010','YYMMDD'));
insert into sample_product VALUES(2,'washer',to_date('241014','YYMMDD'));
insert into sample_product VALUES(3,'clenner',to_date('241024','YYMMDD'));

----------------테이블 또또또 추가--------
ALTER TABLE sample_product 
ADD factory VARCHAR2(10);

---열변경 
ALTER TABLE sample_product 
MODIFY (factory VARCHAR2(20));
