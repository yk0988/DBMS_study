
--------------------------case문----------------------------

DROP PROCEDURE IF EXISTS caseProc;
DELIMITER $$

CREATE PROCEDURE caseProc()
BEGIN
    DECLARE point INT;  
    DECLARE credit CHAR(1);
    
    -- 초기 점수 설정
    SET point = 88;
    
    -- 점수에 따른 학점 계산
    CASE
        WHEN point >= 90 THEN
            SET credit = 'A';
        WHEN point >= 80 THEN
            SET credit = 'B';
        WHEN point >= 70 THEN
            SET credit = 'C';
        WHEN point >= 60 THEN
            SET credit = 'D';
        ELSE
            SET credit = 'F';
    END CASE;
    
    -- 결과 출력
    SELECT CONCAT('취득점수: ', point), CONCAT('학점: ', credit);
END$$

DELIMITER ; 

-- 프로시저 호출
CALL caseProc();


--------------------206--------------------
SELECT M.mem_id, M.mem_name, SUM(price*amount) "총구매액",
	case
		when(SUM(price*amount) >= 1500) THEN '최우수고객'
		when(SUM(price*amount) >= 1000) THEN '우수고객'
        when(SUM(price*amount) >= 1) THEN '일반고객'
        ELSE '유령고객'
        
        end "회원등급"
        
        from buy B
			RIGHT OUTER JOIN member M
            on B. mem_id = M.mem_id
            GROUP BY M.mem_id
            ORDER BY SUM(price*amount) DESC;
			
            
--------------------209--------------------

DROP PROCEDURE IF EXISTS whileProc2;


DELIMITER $$

CREATE PROCEDURE whileProc2()
BEGIN
    DECLARE i INT;  
    DECLARE hap INT;
    SET i = 1;
    SET hap = 0;
    
    myWhile: 
    WHILE i <= 100 DO  -- `DO` 대신 `BEGIN`을 사용하여 여러 문을 실행
        -- 4로 나누어 떨어지면 건너뛰기
        IF i % 4 = 0 THEN
            SET i = i + 1;  -- 4로 나누어 떨어지면 i를 증가시키고 루프 건너뛰기
            ITERATE myWhile;
        END IF;
        
        -- hap에 i 값을 더하기
        SET hap = hap + i;
        
        -- hap 값이 1000을 초과하면 루프 종료
        IF hap > 1000 THEN
            LEAVE myWhile;
        END IF;
        
        SET i = i + 1;  -- i 값 증가
    END WHILE;
    
    SELECT CONCAT('1부터 100까지의 합(4배수 제외), 1000 넘으면 종료 ==> ', hap);
    
END$$

DELIMITER ; 

-- 프로시저 호출
CALL whileProc2();



CALL caseProc2();
    
