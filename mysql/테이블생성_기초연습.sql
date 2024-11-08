use webdb;
-------------------pk추가-----------------------
ALTER TABLE member
ADD CONSTRAINT pk_member_id PRIMARY KEY (member_id);


-------------------테이블생성----------------------------------------

create table member(
member_id char(8) not null,
member_name char(5) not null,
member_addr char(20) not null
);

create table product(
product_name char(10) not null,
cost int not null,
make_date date,
company char(5) ,
amount int not null,
PRIMARY KEY (product_name)
);


insert into member(
member_id ,member_name ,member_addr )
value('테스','나훈아','경기도사람');
insert into member(
member_id ,member_name ,member_addr )
value('히어로','임영웅','경기도사람');
insert into member(
member_id ,member_name ,member_addr )
value('iu','아이유','여자사람');
insert into member(
member_id ,member_name ,member_addr )
value('비닐옷','박진영','충격적사람');
insert into member(
member_id ,member_name ,member_addr )
value('carry','머라이어','외국사람');

--추가 / 수정---
UPDATE member
SET member_addr = '경로당 순회 공연장'
WHERE member_id = '히어로';

UPDATE member
SET member_addr = '영국 먹자 골목'
WHERE member_id = 'carry';

UPDATE member
SET member_addr = '충격과 공포의 청담동'
WHERE member_id = '비닐옷';



---삭제---
DELETE FROM member
WHERE member_id = 'iu';


-----------------------------------------------------------

INSERT INTO product (product_name, cost, make_date, company, amount
) VALUES ('바나나', 1500, '2021-07-01', '델몬트', 17
);

INSERT INTO product (product_name, cost, make_date, company, amount
) VALUES ('삼각김밥', 800, '2023-04-06', '씨제이', 22
);

INSERT INTO product (product_name, cost, make_date, company, amount
) VALUES ('카스', 1500, '2021-04-01', 'ob', 3
);


-----------------------DEFAULT(지정하지 않은 날짜 자동생성)------------------------------------

CREATE TABLE product2 (
    product_name CHAR(10) NOT NULL,
    cost INT NOT NULL,
    make_date DATE DEFAULT (CURRENT_DATE),  -- 현재 날짜로 기본값 설정
    company CHAR(5),
    amount INT NOT NULL,
    PRIMARY KEY (product_name)
);

INSERT INTO product2(product_name, cost, company, amount) 
VALUES ('카스', 1500, 'ob', 3);


INSERT INTO product2 (product_name, cost, make_date, company, amount
) VALUES ('삼각김밥', 800, '2023-04-06', '씨제이', 22
);