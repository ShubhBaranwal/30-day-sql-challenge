CREATE DATABASE PRAC_COMPANY;
USE PRAC_COMPANY;
CREATE TABLE EMPLOYEE(
EMPID INT PRIMARY KEY,
EMPNAME VARCHAR(50),
GENDER CHAR,
SALARY INT,
CITY VARCHAR(50)
);
INSERT INTO EMPLOYEE(EMPID,EMPNAME,GENDER,SALARY,CITY)
VALUES
(1,"ARJUN","M",75000,"PUNE"),
(2,"EKDANTA","M",125000,"BANGALORE"),
(3,"LALITA","F",1500000,"MATHURA"),
(4,"MADHAV","M",250000,"DELHI"),
(5,"VISAKHA","F",120000,"MATHURA");


DROP TABLE EMPDETAILSS;
CREATE TABLE EMPDETAILS(
EMPID INT PRIMARY KEY NOT NULL,
PROJECT VARCHAR(50),
EMPPOSITION VARCHAR(50),
DOJ DATE
);

INSERT INTO EMPDETAILS(EMPID,PROJECT,EMPPOSITION,DOJ)
VALUES
(1,"P1","EXECUTIVE","2019-01-26"),
(2,"P2","EXECUTIVE","2020-04-05"),
(3,"P1","LEAD","2021-10-21"),
(4,"P3","MANAGER","2018-11-29"),
(5,"P2","MANAGER","2020-08-01");



-- FIND THE LIST OF EMPLOYEES WHOSE SALARY RANGES BETWEEN 2L AND 3L

SELECT EMPNAME,SALARY 
FROM EMPLOYEE
WHERE SALARY > 200000 AND SALARY < 300000;

SELECT EMPNAME,SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 200000 AND 300000;


-- WRITE A QUERY TO RETRIVE THE LIST OF EMPLOYEES FROM SAME CITY
SELECT E1.EMPID,E1.EMPNAME,E1.CITY
FROM EMPLOYEE E1,EMPLOYEE E2
WHERE E1.CITY=E2.CITY AND E1.EMPID != E2.EMPID;

-- QUERY TO FIND THE NULL VALUES IN THE EMPLOYEE TABLE
SELECT * FROM EMPLOYEE 
WHERE EMPID IS NULL;

-- QUERY TO FIND THE CUMULATIVE SUM OF EMPLOYEE'S SALARY
SELECT EMPID,SALARY,SUM(SALARY) OVER (ORDER BY EMPID) AS CUMULATIVESUM
FROM EMPLOYEE;

-- WHAT'S THE MALE AND FEMALE EMPLOYEES RATIO
SELECT 
    (SUM(CASE WHEN GENDER = 'M' THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS MALEPCT,
    (SUM(CASE WHEN GENDER = 'F' THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS FEMALEPCT
FROM EMPLOYEE;




