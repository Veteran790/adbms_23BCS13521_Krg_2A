--------------------MEDIUM------------------
--You are a Database Engineer at TalentTree Inc., an enterprise HR analytics platform that stores employee data, including their reporting relationships. 
--The company maintains a centralized Employee relation that holds:Each employee’s ID, name, department, and manager ID (who is also an employee in the same table).
--Your task is to generate a report that maps employees to their respective managers, showing:
--The employee’s name and department
--Their manager’s name and department (if applicable)
--This will help the HR department visualize the internal reporting hierarchy.

CREATE DATABASE TALENTTREEINC;

CREATE TABLE EMPLOYEE(
EmpID INT PRIMARY KEY,
Ename VARCHAR(50),
Department VARCHAR(100),
ManagerID INT,
FOREIGN KEY (ManagerID) REFERENCES EMPLOYEE(EmpID)
);

SELECT 
	E1.Ename AS EMPLOYEE_NAME,
    E2.Ename AS MANAGER_NAME,
    E1.Department AS EMP_DEPT,
    E2.Department AS MANAGER_DEPT
FROM 
EMPLOYEE AS E1
JOIN
EMPLOYEE AS E2
ON E1.ManagerID = E2.EmpID



--------------------------- HARD -------------------------

---HARD LEVEL
--(B) part

-- Create Year_tbl (holds actual NPV values)
CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV INT
);

-- Create Queries table (requested values)
CREATE TABLE Queries (
    ID INT,
    YEAR INT
);

-- Insert data into Year_tbl
INSERT INTO Year_tbl (ID, YEAR, NPV)
VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

SELECT * FROM Year_tbl;

-- Insert data into Queries
INSERT INTO Queries (ID, YEAR)
VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

SELECT * FROM Queries;

SELECT
 Q.ID,
 Q.YEAR,
 ISNULL(Y.NPV, 0) AS NPV
FROM
 Queries AS Q
LEFT OUTER JOIN
 Year_tbl AS Y
ON
 Q.ID = Y.ID AND Q.YEAR = Y.YEA
