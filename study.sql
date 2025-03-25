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


-- 학생은 한학기에 최대 10학점까지만 수강 할 수 있다.