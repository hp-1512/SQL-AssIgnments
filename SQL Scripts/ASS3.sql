CREATE TABLE Department(
dept_id INT NOT NULL PRIMARY KEY,
dept_name VARCHAR(50) 
);

CREATE TABLE Employee(
emp_id INT NOT NULL PRIMARY KEY,
dept_id INT FOREIGN KEY REFERENCES Department(dept_id),
mngr_id INT NOT NULL,
emp_name VARCHAR(30),
salary DECIMAL(10,2)
);

ALTER TABLE Employee ALTER COLUMN mngr_id INT NULL

INSERT INTO Department(dept_id,dept_name)
VALUES (1001,'FINANCE'),
(2001,'AUDIT'),
(3001,'MARKETING'),
(4001,'PRODUCTION');

INSERT INTO Employee(emp_id,dept_id,mngr_id,emp_name,salary)
VALUES (1101,1001,NULL,'SNAPE',6000.00),
(1102,3001,0000,'KARIM',2750.00 ),
(1103,1001,0000,'EDWARD',2550.00 ),
(1104,2001,0000,'HARRY',2957.00  ),
(1105,2001,2222,'MILIN',3100.00  ),
(1106,2001,2222,'JEFF',3100.00  ),
(1107,2001,3333,'RON',900.00  ),
(1108,3001,4444,'ALEX',1700.00 ),
(1109,3001,4444,'MAGNUS',1350.00 ),
(1110,3001,4444,'JESS',1350.00 ),
(1111,3001,4444,'JAKE',1600.00 ),
(1112,2001,5555,'NYTIREE',1200.00 ),
(1113,3001,6666,'SHYAM',1050.00 ),
(1114,1001,5555,'ROHAN',1400.00 );

--Query 1
SELECT emp_name,Employee.dept_id,salary 
FROM Employee
INNER JOIN
(SELECT dept_id,MAX(salary) as [Highest Salary]
FROM Employee
GROUP BY dept_id) AS b
on salary = b.[Highest Salary]

--Query 2
SELECT Department.dept_id,dept_name,
COUNT(emp_id) AS [Number of Employees] 
FROM Department
INNER JOIN
Employee 
ON Department.dept_id = Employee.dept_id 
GROUP BY Department.dept_id,dept_name
HAVING COUNT(emp_id) < 3

--Query 3
SELECT Department.dept_name, 
COUNT(emp_id) AS [Number of People in the Dept]
FROM Employee
JOIN Department 
ON Department.dept_id = Employee.dept_id
GROUP BY Department.dept_name


--Query 4
SELECT dept_name,Employee.dept_id, 
SUM(salary) AS [Total Salary]
FROM Employee
JOIN Department 
ON Employee.dept_id = Department.dept_id
GROUP BY dept_name,Employee.dept_id
