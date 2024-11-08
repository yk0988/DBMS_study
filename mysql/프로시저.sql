---------프로시저 학습------

DROP PROCEDURE IF EXISTS ifProc1;
DELIMITER $$
CREATE PROCEDURE ifProc1()
BEGIN
    IF 100 = 100 THEN
        SELECT '100은 100과 같습니다.';
    END IF;
END$$
DELIMITER ;

CALL ifProc1();

------------프로시저 학습(2)----------

DROP PROCEDURE IF EXISTS ifProc2;

DELIMITER $$
CREATE PROCEDURE ifProc2()
BEGIN
    DECLARE myNum INT;  
    SET myNum = 200;   
    IF myNum = 100 THEN
        SELECT '100 입니다.';
    ELSE
        SELECT '100 아닙니다.';
    END IF;
END$$
DELIMITER ; 
CALL ifProc2();

-----프로시저 학습(3)------------
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
    DECLARE debutDate DATE;  
    DECLARE curDate DATE;   
    DECLARE days INT;

    SELECT debut_Date INTO debutDate
    FROM market_db.member 
    WHERE mem_id = 'APN';

    SET curDate = CURRENT_DATE;
    SET days = DATEDIFF(curDate, debutDate);
    
    IF (days / 365) >= 5 THEN
        SELECT CONCAT('데뷔한지 ', days, '일 축하축하');
    ELSE
        SELECT '데뷔한지 ', days, '일 밖에 안되었네요.';
    END IF;
END$$
DELIMITER ; 
CALL ifProc3();



