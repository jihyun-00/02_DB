-- 테이블 만들기
CREATE TABLE TB_MEMBER(
	MEMBER_ID     VARCHAR2(30) CONSTRAINT TB_MEMBER_ID_PK PRIMARY KEY,
	MEMBER_PW     VARCHAR2(30) NOT NULL,
	MEMBER_NAME   VARCHAR2(30) NOT NULL,
	SIGNUP_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN TB_MEMBER.MEMBER_ID     IS '회원 아이디';
COMMENT ON COLUMN TB_MEMBER.MEMBER_PW     IS '회원 비밀번호';
COMMENT ON COLUMN TB_MEMBER.MEMBER_NAME   IS '회원 이름';
COMMENT ON COLUMN TB_MEMBER.SIGNUP_DATE IS '회원 가입일';



INSERT INTO TB_MEMBER
VALUES('user01', 'pass01', '유저일', DEFAULT );

INSERT INTO TB_MEMBER
VALUES('user02', 'pass02', '유저이', DEFAULT );

SELECT * FROM TB_MEMBER
ORDER BY 4;

----------------------------------------------------------------------------

-- 테이블 만들기
CREATE TABLE TB_TODO(
	MEMBER_ID     VARCHAR2(30) CONSTRAINT TB_MEMBER_PK PRIMARY KEY,
	TODO_TITLE     VARCHAR2(30) NOT NULL,
	TODO_CONTENT	VARCHAR2(30) NOT NULL,
	COMPLETE_YN   CHAR(1) DEFAULT 'N' NOT NULL,
	WRITE_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN TB_TODO.MEMBER_ID     IS '회원 아이디';
COMMENT ON COLUMN TB_TODO.TODO_TITLE     IS '할 일 제목';
COMMENT ON COLUMN TB_TODO.TODO_CONTENT     IS '할 일 내용';
COMMENT ON COLUMN TB_TODO.COMPLETE_YN   IS '완료 여부';
COMMENT ON COLUMN TB_TODO.WRITE_DATE IS '작성일';

INSERT INTO TB_TODO
VALUES('user01', 'DB 숙제', 'DB option 예제문제 풀기', DEFAULT, DEFAULT );

INSERT INTO TB_TODO
VALUES('user02', '코딩', '투두리스트 풀기', DEFAULT, DEFAULT );

UPDATE TB_TODO
SET TODO_TITLE = '코딩하기',
TODO_CONTENT = '투두리스트 완료하기'
WHERE MEMBER_ID = 'user02'
AND ROW_NUM = 1;



SELECT * FROM TB_TODO
ORDER BY 5;

------------------------------------------------------------------------------

/* VIEW를 생성하기 위해서는 권한이 필요하다 ! */ 
-- (SYS 관리자 계정 접속)
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
--> 계정명이 언급되는 상황에서는 이 구문 필수적으로 진행!

-- VIEW 생성 권한 부여
GRANT CREATE VIEW TO todo;

--TODO 계정으로 접속
--VIEW 구문 실행

--> VIEW 생성 구문 기초 문법

SELECT * FROM V_MEMBER;
SELECT * FROM V_TODO
WHERE MEMBER_ID = 'user01';

DROP VIEW V_MEMBER;

-----------------------------------------------------------------------------------------

/* WITH READ ONLY 옵션 사용하기 */

-- 왜 사용할까?
--> VIEW 이용해서 DML(INSERT/UPDATE/DELETE) 막기 위해서!

CREATE OR REPLACE VIEW V_MEMBER
AS SELECT * FROM TB_MEMBER
WITH READ ONLY; -- 읽기전용

CREATE OR REPLACE VIEW V_TODO
AS SELECT * FROM TB_TODO
WITH READ ONLY; -- 읽기전용


CREATE VIEW V_TODO AS
SELECT 
    ROW_NUMBER() OVER (ORDER BY WRITE_DATE) AS row_num,
    MEMBER_ID, 
    TODO_TITLE, 
    TODO_CONTENT, 
    COMPLETE_YN, 
    WRITE_DATE
FROM TB_TODO;

CREATE VIEW V_MEMBER AS
SELECT 
    ROW_NUMBER() OVER (ORDER BY SIGNUP_DATE) AS row_num,
    MEMBER_ID, 
    MEMBER_PW, 
    MEMBER_NAME, 
    SIGNUP_DATE
FROM TB_MEMBER;