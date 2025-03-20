--한 줄 주석
/*
 * 범위주석
 */

-- 선택한 SQL 수행 : 구문에 커서를 두고 Ctrl + Enter
-- 전체 SQL 수행 : 전체 구문을 활성화(ctrl + A) 시킨 채로(alt + X)


--12c 버전 이전 문법 허용 구문
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

--계정 생성 구문(username : kh / password : kh1234)
CREATE USER kh IDENTIFIED BY kh1234;

GRANT RESOURCE, CONNECT TO kh;

--사용자 계정 권한 부여 설정
--RESOURCE : 테이블이나 인덱스 같은 DB 객체를 생성할 권한
--CONNECT : DB에 연결하고 로그인 할 수 있는 권한

ALTER USER kh DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
--객체가 생성될 수 있는 공간 할당량 무제한 지정
-----------------------------------------------------------------------
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER kh IDENTIFIED BY kh1234;
GRANT CONNECT, RESOURCE TO khshop;
ALTER USER khshop DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;

<<<<<<< Updated upstream
-----------------------------------------------------------------------
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER todo IDENTIFIED BY list;
GRANT CONNECT, RESOURCE TO todo;
ALTER USER todo DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
=======
----------------------------------------------------------------------------------------


ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER khshop IDENTIFIED BY kh1234;
GRANT CONNECT, RESOURCE TO khshop;
ALTER USER khshop DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;

----------------------------------------------------------------------------------------


ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER workbook IDENTIFIED BY workbook;
GRANT CONNECT, RESOURCE TO workbook;
ALTER USER workbook DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
>>>>>>> Stashed changes
