use market_db;
drop procedure if exists user_proc;
delimiter $$

create procedure user_proc()
begin
SELECT*FROM member;
end $$
delimiter ; 

call user_proc();


DROP PROCEDURE IF EXISTS user_proc3;
DELIMITER $$  
CREATE PROCEDURE user_proc3 (
    IN userName VARCHAR(10),
    OUT outValue INT )
BEGIN
    INSERT INTO noTable VALUES (NULL, userName);
    SELECT MAX(id) INTO outValue FROM noTable;
END $$  
DELIMITER ; 

--- 테이블 존재 여부--
desc noTable;

CREATE TABLE IF NOT EXISTS noTable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    txt CHAR(10)
);

call user_proc3 ('테스트1', @myValue);
select concat('입력된 ID값 ==>', @myValue);

alter table second
add constraint
unique (mem_id);
select*from second;
