
drop database if exists naver_db;--기존에 있으면 삭제
create database naver_db; -- 지웠다가 다시 생성 리플레시 올


ALTER TABLE naver_db.buy MODIFY group_name VARCHAR(255) NULL;

CREATE TABLE naver_db.member (
    mem_id CHAR(8) NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10) NOT NULL,
    mem_number TINYINT NOT NULL,
    addr CHAR(2) NULL,
    phone1 CHAR(3) NULL,
    phone2 CHAR(3) NULL,
    height TINYINT unsigned NULL, -- 음수 필요없음
    debut_date DATE NULL
);

select * from member;

INSERT INTO member VALUES ('TWC', '트와이스', 9, '서울', '02', '111', 167, '2015-10-19');
INSERT INTO member VALUES ('BLK', '블랙핑크', 4, '경남', '055', '222', 163, '2016-8-8');
INSERT INTO member VALUES ('WMN', '여자친구', 6, '경기', '031', '333', 166, '2015-1-15');

------------------------------------------------------------------

CREATE TABLE naver_db.buy (
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번
    mem_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL, 
    group_name CHAR(4) NULL, 
    price INT UNSIGNED NULL,
    amount SMALLINT UNSIGNED NULL,
    FOREIGN KEY (mem_id) REFERENCES naver_db.member(mem_id)
);

select * from buy;

INSERT INTO buy VALUES (null, 'BLK', '지갑', null, 30 , 2);
INSERT INTO buy VALUES (null, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES (null, 'APN', '아이폰', '디지털', 200, 1);

--------------------------외래키 제약 조건-----------------------------
----알터 테이블------------------------------------------------------

describe member;
-- 'member'라는 테이블이 있으면 삭제
DROP TABLE IF EXISTS member;

CREATE TABLE member (
    mem_id CHAR(8) NOT NULL ,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT unsigned NULL, -- 음수 필요없음
    alter table member
    add constraint
    primary key (mem_id)
);

CREATE TABLE member (
    mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL, -- 음수는 없고, NULL 허용
    CONSTRAINT pk_member_mem_id PRIMARY KEY (mem_id)  -- PRIMARY KEY 제약 조건
);

----포레잉키
데이터베이스에서 두 테이블 간의 관계를 설정하는 중요한 제약조건----------------------------

DROP TABLE IF EXISTS member,buy; 
-- member 테이블 생성
CREATE TABLE member ( --  기준 테이블
    mem_id CHAR(8) NOT NULL PRIMARY KEY,  -- 회원 ID
    mem_name VARCHAR(10) NOT NULL,        -- 회원 이름
    height TINYINT UNSIGNED NULL          -- 회원 키, 음수는 없고, NULL 허용
);

-- buy 테이블 생성
CREATE TABLE buy (  
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,  -- 구매 순번
    mem_id CHAR(8) NOT NULL,                       -- 회원 ID / 열 이름
    prod_name VARCHAR(50) NOT NULL,                -- 제품 이름 (길이를 늘려서 VARCHAR 사용)
    FOREIGN KEY (mem_id) REFERENCES member(mem_id) -- 외래키 제약, member 테이블의 mem_id 참조
);             -- 열 이름          --- 기준 테이블이름

---------------------------------------------
DROP TABLE IF EXISTS buy; 

CREATE TABLE buy (
   num INT AUTO_INCREMENT NOT NULL,             -- 구매 순번 (Primary Key)
   mem_id CHAR(8) NOT NULL,                     -- 회원 ID
   prod_name VARCHAR(6) NOT NULL,               -- 상품 이름
   PRIMARY KEY (num),                           -- 구매 순번을 기본키로 설정
   CONSTRAINT fk_member_id FOREIGN KEY (mem_id)  -- 외래키 제약조건 추가
       REFERENCES member(mem_id)               -- member 테이블의 mem_id를 참조
);

INSERT INTO member VALUES ('BLK', '블랙핑크', 163);
INSERT INTO buy VALUES (null, 'BLK', '지갑');
INSERT INTO buy VALUES (null, 'BLK', '맥북');

select M.mem_id, M.mem_name, B.prod_name
From buy B 
inner JOIN member M
ON B.mem_id = M.mem_id;

------------------onupdatecascade 
기준 테이블 테이터 삭제시 참조테이블 데이터도 삭제----------------------

-- 'buy' 테이블이 이미 존재하면 삭제
DROP TABLE IF EXISTS buy;

-- 'buy' 테이블 생성
CREATE TABLE buy (
   num INT AUTO_INCREMENT NOT NULL,             -- 구매 순번 (Primary Key)
   mem_id CHAR(8) NOT NULL,                     -- 회원 ID
   prod_name VARCHAR(6) NOT NULL,               -- 상품 이름
   PRIMARY KEY (num)                            -- 구매 순번을 기본키로 설정
);

-- 외래키 제약조건 추가 (mem_id는 member 테이블의 mem_id를 참조)
ALTER TABLE buy
   ADD CONSTRAINT fk_mem_id FOREIGN KEY (mem_id) 
       REFERENCES member(mem_id)
       ON UPDATE CASCADE;  -- member 테이블에서 mem_id가 변경되면 buy 테이블의 해당 값도 자동 업데이트

INSERT INTO buy VALUES (null, 'BLK', '지갑');
INSERT INTO buy VALUES (null, 'BLK', '맥북');

update member SET mem_id = 'pink' where mem_id='BLK';
select M.mem_id, M.mem_name, B.prod_name
From buy B 
inner JOIN member M
ON B.mem_id = M.mem_id;

delete from member where mem_id='pink';
select*from buy;


------------------ 고유 키 제약조건---------------------
DROP TABLE IF EXISTS buy, member;

CREATE TABLE member (
    mem_id CHAR(8) NOT NULL PRIMARY KEY,      -- 회원 ID (8자 고유값)
    mem_name VARCHAR(10) NOT NULL,            -- 회원 이름 (최대 10자)
    height TINYINT UNSIGNED NULL,             -- 키 (음수 필요 없으므로 UNSIGNED 사용)
    email VARCHAR(50) UNIQUE NULL             -- 이메일 (최대 50자, 유니크 제약조건)
);
INSERT INTO member VALUES ('BLK', '블랙핑크', 163, 'pink@gamil.com');
INSERT INTO member VALUES ('TWC', '트와이스', 167, null);
INSERT INTO member VALUES ('APN', '에이핑크', 163, null);
-- null 값은 되지만 중복은 안됨

------------------ 체크 제약조건---------------------

DROP TABLE IF EXISTS member;

CREATE TABLE member (
    mem_id CHAR(8) NOT NULL PRIMARY KEY,      -- 회원 ID (8자 고유값)
    mem_name VARCHAR(10) NOT NULL,            -- 회원 이름 (최대 10자)
    height TINYINT UNSIGNED NULL CHECK (height >= 100),             -- 키 (음수 필요 없으므로 UNSIGNED 사용)
	phone1 CHAR(3) NULL
);

INSERT INTO member VALUES ('BLK', '블랙핑크', 163, null);
INSERT INTO member VALUES ('TWC', '트와이스', 67, null);
--  제약 조건에서 설정한 범위를 벗어나면 안됨 --
--  필요하다면 alter 테이블 문으로 제약조건 추가 --
ALTER TABLE member
   ADD CONSTRAINT 
   check (phone1 IN('02','031','032','054','055','061')); 
   
INSERT INTO member VALUES ('TWC', '트와이스', 167,'02');
INSERT INTO member VALUES ('TWC', '트와이스', 67, '010');
--  제약 조건에서 설정한 범위를 벗어나면 안됨 --


----------------- 기본값 정의--------------------
DROP TABLE IF EXISTS member;
CREATE TABLE member (
    mem_id CHAR(8) NOT NULL PRIMARY KEY,      -- 회원 ID (8자 고유값)
    mem_name VARCHAR(10) NOT NULL,            -- 회원 이름 (최대 10자)
    height TINYINT UNSIGNED NULL default 160,          
	phone1 CHAR(3) NULL
    );
    
    ALTER TABLE member
    ALTER column phone1 SET default '02';
    
INSERT INTO member VALUES ('RED', '레드벨벳', 167,'054');
INSERT INTO member VALUES ('SPC', '우주소녀', default , default);
select*from member;
