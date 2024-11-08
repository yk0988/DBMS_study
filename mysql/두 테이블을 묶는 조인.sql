
---내부조인----
SELECT * 
    FROM buy
    INNER JOIN member 
    ON buy.mem_id = member.mem_id
WHERE buy.mem_id = 'BLK';


---내부조인(간결하게)--
SELECT buy.mem_id,mem_name,prod_name,addr,CONCAT(phone1,phone2)'연락처'
    FROM buy
    INNER JOIN member 
    ON buy.mem_id = member.mem_id;
    

----테이블명 약호--
    
 SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, 
       CONCAT(M.phone1, M.phone2) AS 연락처
FROM buy B
INNER JOIN member M 
ON B.mem_id = M.mem_id;

----중복된 결과 출력--
SELECT DISTINCT M.mem_id, M.addr
FROM buy B
INNER JOIN member M
 ON B.mem_id = M.mem_id
ORDER BY M.mem_id;

----왼쪽기준 아웃조인----
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
FROM member M
left outer JOIN buy B
 ON M.mem_id = B.mem_id
ORDER BY M.mem_id;


----오른쪽기준 아웃조인----
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
FROM buy B
RIGHT outer JOIN member M
 ON M.mem_id = B.mem_id
ORDER BY M.mem_id;


---자체조인----
create table emp_table (
	emp char(4),
    manager char(4),
    phone varchar(8)
);

select * from emp_table;
insert into emp_table values('대표',null, '0000');
insert into emp_table values('영업이사','대표', '1111');
insert into emp_table values('관리이사','대표', '2222');
insert into emp_table values('정보이사','대표', '3333');
insert into emp_table values('영업과장','영업이사', '1111-1');
insert into emp_table values('경리부장','관리이사', '2222-1');
insert into emp_table values('인사부장','관리이사', '2222-2');
insert into emp_table values('개발팀장','정보이사', '3333-1');
insert into emp_table values('개발주임','정보이사', '3333-1-1');

select A.emp '직원', B.emp '직속상관' , B.phone '직속상관연락처'
from emp_table A
	inner join emp_table B
	on A.manager = B.emp
where A.emp = '개발팀장';


-----------------


