CREATE SEQUENCE seq_board;
drop index pk_board;

CREATE TABLE tbl_board (
    bno NUMBER(10, 0),
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    redate DATE DEFAULT SYSDATE,
    updateate DATE DEFAULT SYSDATE
);

ALTER TABLE tbl_board ADD CONSTRAINT pk_board PRIMARY KEY (bno);


INSERT INTO tbl_board (bno, title, content, white)
VALUES (seq_board.nextval, '제목', '내용', 'user00');



SELECT *
FROM tbl_board;

SELECT * FROM tbl_board ORDER BY bno DESC;


--배가운동 (시뮬레이션 데이타 생성시 사용함) 재귀복사
INSERT INTO tbl_board (bno, title, content, white)
(SELECT seq_board.nextval, title, content, white from tbl_board);


SELECT * FROM tbl_board ORDER BY bno+1 DESC;


--오라클 힌트 기능
SELECT
/*+ INDEX_DESC(tbl_board pk_board) */ 
*
FROM tbl_board
WHERE bno > 0
ORDER BY bno DESC;


SELECT
/*+ FULL(tbl_board) */ 
*
FROM tbl_board ORDER BY bno DESC; 


--romnum으로 1페잊 보기 


