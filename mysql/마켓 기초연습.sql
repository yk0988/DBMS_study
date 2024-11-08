use market_db;

create table hongong1(
	toy_id INT,
    toy_name char(4),
    age int    
);

select * from hongong1;

insert into hongong1 values(1, '우디', 25);member

insert into hongong1(toy_id, toy_name) values(2, '버즈');

insert into hongong1(toy_name, age, toy_id) values('제시', 20, 3);


drop table hongong2;
create table hongong2(
	toy_id INT auto_increment primary key,
    toy_name char(4),
    age int);
    
    
select * from hongong2; 

delete from hongong2 where toy_id = 1;   

alter table hongong2 auto_increment=100;

insert into hongong2(toy_name, age) values('보핍', 25);  
insert into hongong2(toy_name, age) values('슬링키', 22);  
insert into hongong2(toy_name, age) values('렉스', 21);  

insert into hongong2(toy_name, age) values('재남', 35); 


create table hongong3(
	toy_id INT auto_increment primary key,
    toy_name char(4),
    age int);
    
alter table hongong3 auto_increment=1000;    
set @@auto_increment_increment = 3;

show global variables;

select * from hongong3;

select @@auto_increment_increment;


insert into hongong3(toy_name, age) values('토마스', 20); 
insert into hongong3(toy_name, age) values('제임스', 23); 
insert into hongong3(toy_name, age) values('고든', 25); 


SELECT * FROM hongong1;
SELECT * FROM hongong2;
SELECT * FROM hongong3;

drop table city_popul;

CREATE TABLE city_popul (
    city_name CHAR(35),
    population INT
);



select * from city_popul where citi_name='Seoul';

select*from city_popul where citi_name='서울';


insert into city_popul
select name, population From world.city;

UPDATE city_popul
SET citi_name = '서울'
WHERE citi_name = 'Seoul';
select*from city_popul where citi_name='서울';





UPDATE city_popul
SET citi_name = '뉴욕' , population=0
WHERE citi_name = 'New York';

select*from city_popul where citi_name='뉴욕';



delete from city_popul
WHERE citi_name like 'New%';

CREATE TABLE hongong4 (
    tinyint_col1 TINYINT,
    samllint_col2 SMALLINT,
    int_col INT,
    bigint_col BIGINT
);

INSERT INTO hongong4 VALUES (127, 32767, 2147483647, 900000000000);


SELECT num, 
       CONCAT(CAST(Price AS CHAR), 'x', CAST(amount AS CHAR), '=') AS '가격x수량', 
       Price * amount AS '구매액'
FROM buy;
