-- 모든 학생은 학생번호를 부여하여 식별하며 학생이름, 학생주소, 학생전화번호. 학생이메일, 전공 학과,
-- 지도교수 정보, 등록금 납부 계좌 정보를 가진다.
-- 학생은 부전공을 1개까지 신청할 수 있다. 학생은 한학기에 최대 10학점까지만 수강 할 수 있다.

-- 교수와 학생은 학생번호와 교수번호를 이용한 지도 관계를 가지며, 해당 관계에는 현재 학년/학기 정보를 포함한다.

-- 학생은 1개 이상의 동아리에 가입이 가능하다.

CREATE TABLE TB_STUDENT(
		STD_ID NUMBER PRIMARY KEY,
		STD_NAME VARCHAR2(45) NOT NULL,
		STD_ADDRESS VARCHAR2(45),
		STD_PHONE VARCHAR2(45) NOT NULL,
		STD_EMAIL VARCHAR2(45),
		DEPT_TITLE VARCHAR2(45) NOT NULL,
		MINOR_TITLE VARCHAR2(45) DEFAULT NULL,
		ACCOUNT_NUM VARCHAR2(45) NOT NULL
);


-- 학과는 학과번호를 부여하여 식별하며 학과명, 학과전화번호, 학과사무실 정보를 가진다. 해당 학과에서 개설하는 강좌가 반드시 1개 이상 존재해야 하며, 동시에 학과장이 1명 있어야 한다.
-- 강좌테이블에서 학과코드 참조
CREATE TABLE TB_DEPARTMENT(
		DEPT_CODE VARCHAR2(45) PRIMARY KEY,
		DEPT_TITLE VARCHAR2(45) NOT NULL,
		DEPT_TEL VARCHSR2(45) NOT NULL,
		DEPT_OFFICE VARCHAR2(45),
		PROF_BOSS VARCHAR2(45) NOT NULL
);

-- 강좌는 강좌번호, 분반번호, 강의하는 교수, 강좌이름, 강의요일, 강의교시,
-- 취득학점 (1~4), 강좌시간 (1~6), 개설 학과, 강의실 정보가 필요하다.
Create table tb_lecture(
Lct_id varchar2(45),
Class_id varchar2(45),
Prof_id varchar2(45),
Lct_name varchar2(45),
Lct_day char(1),
Lct_period NUMBER,
Credit NUMBER CHECK (Credit IN (1, 2, 3, 4)),
Lct_hour NUMBER (Lct_hour IN (1, 2, 3, 4, 5, 6)),
Dept_id varchar2(45),
Lct_room varchar2(45)
);

-- 수강내역은 학생번호, 강좌번호. 교수번호를 부여하여 식별하며
-- 출석점수, 중간고사점수, 기말고사점수, 기타 점수, 총점 (0 ~ 100), 평점 (A ~ F) 정보를 가진다.
Create table tb_lecture_list(
Std_id varchar2(45),
Lct_no varchar2(45) ,
Prof_id varchar2(45),
Absence NUMBER,
Middle_scr NUMBER,
Final_scr NUMBER,
Ect NUMBER,
Total NUMBER CHECK (Total BETWEEN 1 AND 100),
grade char(1) CHECK (grade IN ('A', 'B', 'C', 'D', 'E', 'F')
);

-- 학생은 1개 이상의 동아리에 가입이 가능하다.
-- 동아리는 동아리 번호, 동아리 이름, 소속 학생 숫자, 회장 학생 정보,
-- 동아리 지도 교수 정보, 동아리방 정보 등을 가져야 한다.
Create table tb_club(
C_id NUMBER,
C_name varchar2(45),
Std_total NUMBER,
Boss_id varchar2(45),
Prof_id varchar2(45),
Room_id varchar2(45)
);

-- 학생별 등록금 납부 내역을 기록해야 한다.
-- 학생 번호, 등록금 납부 연도, 등록금 납부 학기, 등록금 총액,
-- 납부 총액, 마지막 납부 일자가 기록되야 한다.
-- 납부 총액이 등록금 총액 보다 작을 경우에는 수강내역 “신규 삽입”에서 “등록금 미납”오류를 표시해야 한다.
Create table tb_tuition(
Std_id varchar2(45),
PAY_YEAR NUMBER,
PAY-SEMESTER NUMBER,
Total NUMBER,
Pay_total NUMBER,
LAST_Pay_date date sysdate
);