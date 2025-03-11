SELECT * FROM TB_DEPARTMENT td;
SELECT * FROM TB_STUDENT ts;
SELECT * FROM TB_PROFESSOR tp;
SELECT * FROM TB_CLASS tc;

--1번
SELECT STUDENT_NO, STUDENT_NAME, TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD')
FROM TB_STUDENT ts
WHERE DEPARTMENT_NO=002
ORDER BY ENTRANCE_DATE;

--2번
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) != 3;

--3번
SELECT PROFESSOR_NAME 교수이름,
--ROUND(MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR(PROFESSOR_SSN, 1, INSTR(PROFESSOR_SSN, '-')-1)))/12) AS 생년월일
--SYSDATE
--SUBSTR(EMP_NO, 1, INSTR(EMP_NO, '-')-1) AS 생년월일
SUBSTR(PROFESSOR_SSN, 1, INSTR(PROFESSOR_SSN, '-')-1) AS 생년월일
FROM TB_PROFESSOR;
--ORDER BY 2;

MONTHS_BETWEEN(SYSDATE, '2025-07-22')
TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS DAY')


--4번
SELECT SUBSTR(PROFESSOR_NAME, 2) 이름
FROM TB_PROFESSOR tp;

--5번
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT ts
WHERE (TO_CHAR(SUBSTR(ENTRANCE_DATE, 1, 4)))-((SUBSTR(STUDENT_SSN, 1, 2)+1900)+1>20);

--6번
SELECT TO_CHAR(TO_DATE(20201225), 'MM/DD (DY)') FROM DUAL;

--7번
--2099.10.11
--2049.10.11
--1999.10.11
--2049.10.11

--8번
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT ts
WHERE STUDENT_NO NOT LIKE 'A%';

--9번
SELECT AVG()
FROM
WHERE

--10번
SELECT DEPARTMENT_NO "학과번호", COUNT(DEPARTMENT_NO) "학생수(명)"
FROM TB_DEPARTMENT, TB_STUDENT;

SELECT DEPARTMENT_NO "학과번호", COUNT(DEPARTMENT_NO) FROM TB_STUDENT;

