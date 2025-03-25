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

CREATE TABLE TB_DEPARTMENT(
		DEPT_COD VARCHAR2(45) PRIMARY KEY,
		DEPT_TITLE VARCHAR2(45) NOT NULL,
		DEPT_TEL VARCHSR2(45) NOT NULL,
		DEPT_OFFICE VARCHAR2(45),
		PROF_BOSS VARCHAR2(45) NOT NULL
);

-- 강좌테이블에서 학과코드 참조

-- 강좌는 강좌번호, 분반번호, 강의하는 교수, 강좌이름, 강의요일, 강의교시, 취득학점 (1~4), 강좌시간 (1~6), 개설 학과, 강의실 정보가 필요하다.

CREATE TABLE TB_LECTURE(
		LCT_ID VARCHSR2(45) PRIMARY KEY,
		CLASS_NO NUMBER,
		PROF_ID VARCHAR2(45),
		CLASS_NAME VARCHAR(45),
		CLASS_DAY VARCHAR2(45),
		
		
)