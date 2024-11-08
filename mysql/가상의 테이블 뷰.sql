
------ 뷰(View)는 복잡한 쿼리를 간소화하고, 데이터 접근을 추상화하며, 
보안 및 성능 최적화, 재사용성을 제공하는 가상 테이블 --------------


SELECT * FROM v_member;

-- 기존 뷰 삭제
DROP VIEW IF EXISTS v_member;

-- 뷰 재생성
CREATE VIEW v_member AS
SELECT mem_id, mem_name, addr
FROM member;

SELECT mem_name, addr 
FROM v_member
WHERE addr IN ('서울', '경기');

---- sql 단순화 --
DROP VIEW IF EXISTS v_memberbuy;

CREATE VIEW v_memberbuy 
AS
SELECT B.mem_id, M.mem_name, B.prod_name, M.addr,
       CONCAT(M.phone1 , M.phone2) '연락처'
FROM buy B
INNER JOIN member M
ON B.mem_id = M.mem_id;

SELECT * FROM v_memberbuy WHERE mem_name='블랙핑크';


--------- 뷰의 실제 작동 ------------

USE market_db;

-- 뷰(View) 생성
DROP VIEW v_viewtest1;
SELECT * FROM v_viewtest1;

CREATE VIEW v_viewtest1 AS
SELECT 
    B.mem_id AS 'Member ID', 
    M.mem_name AS 'Member Name', 
    B.prod_name AS 'prod_name',
    CONCAT(M.phone1 , M.phone2) AS 'Office Phone'
FROM 
    buy B
INNER JOIN 
    member M ON B.mem_id = M.mem_id;

SELECT DISTINCT 
    `Member ID`, 
    `Member Name`
FROM 
    v_viewtest1;

--------- 뷰의 정보 확인------------

CREATE OR REPLACE VIEW v_viewtest2 
AS
SELECT mem_id, mem_name, addr 
FROM Member;

describe v_viewtest2; 
describe member;
show create view v_viewtest2; 

---- 뷰를 통한 테이블 수정 삭제 --

update v_member set addr = '부산' WHERE mem_id='BLK';
select*from member;

create view v_height167
as
select*from member WHERE height >=167;
select*from v_height167;

-- withcheckoption을 통한 입력--
delete from v_height167 WHERE height < 167;
insert into v_height167 values('TRA','티아라',6,'서울',NUll,NUll,159,'2005_01_01');

alter view v_height167
as
select*from member WHERE height >=167

---- 키가 167 미만인 데이터는 입력되지 않음 --

with check option;
insert into v_height167 values('TRA','티아라',6,'서울',NUll,NUll,159,'2005_01_01');


-- 뷰가 참조하는 테이블의 삭제 --
DROP table if EXISTS buy, member;
select*from v_height167;

check table v_height167;
