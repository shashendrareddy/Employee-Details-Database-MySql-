create database employee;
use employee;
create table Employee(
EMPLOYEE_ID int,
FIRST_NAME TEXT,
LAST_NAME char(60),
SALARY varchar(70),
JOINING_DATE varchar(80),
DEPARTMENT varchar(90),
primary key(Employee_ID));
Drop table Employee_details;
select * from Employee_details;
insert into Employee(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
(1,'Venkatesh','s',100000,'08/28/2015','Banking'),
(2,'Ragavi','p',75000,'08/28/2015','Business'),
(3,'Gopinath','c',50000,'03/02/2016','Pharma'),
(4,'Dinesh','g',50000,'03/02/2016','Insurance'),
(5,'Saibabu','e',40000,'07/08/2017','Softtware'),
(6,'Hasan','s',29000,'07/08/2017','Manufacturing'),
(7,'Divya','p',33000,'07/08/2017','Healthcare'),
(8,'Aravindam','r',40000,'07/08/2017','Healthcare'),
(9,'Satish','md',45000,'03/02/2016','Automobile'),
(10,'Prasanth','pkp',94000,'03/02/2016','Insurance'),
(11,'Vijay','r',25684,'03/02/2016','Business'),
(12,'Sivakumar','k',54789,'03/02/2016','Software');



create table incentives(
EMPLOYEE_REF_ID int,INCENTIVE_DATE varchar(40),INCENTIVE_AMOUNT varchar(55),
foreign key(EMPLOYEE_REF_ID) references Employee(EMPLOYEE_ID));
select * from incentives;
insert into incentives values
(1,'01-FEB-16',5000),
(2,'01-FEB-16',3000),
(3,'01-FEB-17',4000),
(1,'01-FEB-17',4500),
(2,'01-FEB-17',9500);


-- Get all  employee details from the employee table
select * from Employee;

-- Get first_name,last_name from the employee table
select FIRST_NAME,LAST_NAME from Employee;

-- Get first_name from employee table using alias name "employeename"
select FIRST_NAME as EMPLOYEE_NAME from Employee;

-- Get first_name from employee table in upper case
select upper(FIRST_NAME) from Employee;

-- Get first_name from employee table in lower case
select lower(FIRST_NAME) from Employee;

-- Get unique department from table
select distinct DEPARTMENT from Employee;

-- Get first 3 characters of first_name from employee
select substring(FIRST_NAME,1,3) first_name  from Employee;

-- Get position of 'a' in name 'ragavi' from employee table
select position('a' in FIRST_NAME) position_of_a_ragavi from employee where EMPLOYEE_ID; 

-- Get first_name from employee table after removing white spaces from right side
select rtrim(FIRST_NAME) first_name from Employee;

-- Get first_name from employee table after removing white spaces from left side
select ltrim(FIRST_NAME) first_name from Employee;

-- Get length of first_name from employee table
select length(FIRST_NAME) from Employee;

-- Get first_name from employee table after replacing 'a' with '$'
select replace(FIRST_NAME,'a','$') from Employee; 

-- Get first_name and last_name as single column from employee table seperated by a'_'
select concat(FIRST_NAME,'_',LAST_NAME) from Employee;

-- Get first_name,joiningyear,joiningmonth, and joiningdate from employee table
select FIRST_NAME,substring(JOINING_DATE,7,4),substring(JOINING_DATE,4,2),substring(JOINING_DATE,1,2) from Employee;

-- Get all employee details from the employee table order by first_name ascending
select * from Employee order by FIRST_NAME asc;

-- Get all employee details from the employee table order by first_name descending
select * from Employee order by FIRST_NAME desc;

-- Get all employee details from the employee table order by first_name ascending and salary descending
select * from Employee order by FIRST_NAME asc,SALARY desc;

-- Get employee details from employee table whose employee name is" dinesh"
select * from Employee where FIRST_NAME='DINESH';

-- Get employee details from employee table whose employee name are" dinesh" and" roy"
select * from Employee where FIRST_NAME='DINESH'or'ROY';

-- Get employee details from employee table whose employee name are not" dinesh" and" roy"
select * from Employee where FIRST_NAME<>'DINESH' and FIRST_NAME<>'ROY';

-- Get employee details from employee table whose first name starts with 's'
select * from Employee where FIRST_NAME LIKE 's%';

-- Get employee details from employee table whose first name starts with 'v'
select * from Employee where FIRST_NAME LIKE '%v%';

-- Get employee details from employee table whose first name ends with 'n' 
select * from Employee where FIRST_NAME LIKE '%n';

-- Get employee details from employee table whose first name ends with 'n' and name contains 4 letters
select * from Employee where FIRST_NAME LIKE '___n';


-- Get employee details from employee table whose first name ends with 'j' and name contains 4 letters
select * from Employee where FIRST_NAME LIKE '___j';

-- Get employee details from employee table whos' s salary greater than 60000
select * from Employee where SALARY>60000;

-- Get employee details from employee table whos' s salary less than 80000
select * from Employee where SALARY<80000;


-- Get employee details from employee table whos' s salary between 50000 and 80000
select * from Employee where SALARY<80000 and SALARY>50000;

-- Get employee details from employee table whose name is venkatesh and ragvi
select * from Employee where FIRST_NAME='venkatesh' or FIRST_NAME='ragavi';

-- Get employee from employee table who has '%' in last_name.tip escape
select * from Employee where LAST_NAME LIKE "%%!%" escape '!';

-- Get last_name from employee table after replacing special character with white space
select replace(LAST_NAME,' ','!') from Employee;

-- Get department, total salary with respect to a department from employee table.
select DEPARTMENT,sum(salary) as total_salary from Employee group by DEPARTMENT;

-- Get department, total salary with respect to a department from employee table order by total salary descending
select DEPARTMENT,sum(salary) as total_salary from Employee group by DEPARTMENT order by total_salary desc;

-- Ger department, no of employees in a department, total salary with respect to a department from employee table order salary descending
select DEPARTMENT,sum(salary) as total_salary from  Employee group by DEPARTMENT order by total_salary desc;

-- 44. Get department wise average salary from employee table order by salary ascending

select DEPARTMENT, avg(SALARY) from Employee group by DEPARTMENT order by avg(SALARY) asc;

-- 45. Get department wise maximum salary from employee table order by salary ascending

select DEPARTMENT, max(SALARY) from Employee group by DEPARTMENT order by max(SALARY) asc;

-- 46. Get department wise minimum salary from employee table order by salary ascending

select DEPARTMENT, min(SALARY) from Employee group by DEPARTMENT order by min(SALARY) asc;

-- 47. Select no of employees joined with respect to year and month from employee table

select year(str_to_date(JOINING_DATE, '%m/%d/%Y')) JOIN_YEAR,
month(str_to_date(JOINING_DATE, '%m/%d/%Y')) JOIN_MONTH, 
count(*) from employee group by JOIN_YEAR , JOIN_MONTH order by JOIN_YEAR, JOIN_MONTH;

-- 48. Select department, total salary with respect to a department from employee table where total salary greater than 800000 Total_Salary descending

select DEPARTMENT, sum(SALARY) from Employee group by DEPARTMENT having sum(SALARY) > 800000 order by sum(SALARY) desc;

-- SOL Queries Interview Questions and Answers on "SQL Joins" - Examples
-- 49. Select first_name, incentive amount from employee and incentives table for those employees who have incentives

select E.FIRST_NAME, I.INCENTIVE_AMOUNT
from EMPLOYEE E
inner join INCENTIVES I on E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID;

-- 50. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentiv greater than 3000

select E.FIRST_NAME, I.INCENTIVE_AMOUNT
from EMPLOYEE E
inner join INCENTIVES I on E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID 
WHERE I.INCENTIVE_AMOUNT > 3000;

-- 51. Select first_name, incentive amount from employee and incentives table for all employes even if they didn't get incentives

select E.FIRST_NAME, I.INCENTIVE_AMOUNT
from EMPLOYEE E
left join INCENTIVES I on E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID ;

-- 52. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentiv incentive amount as O for those employees who didn't get incentives.
select E.FIRST_NAME, IFNULL(I.INCENTIVE_AMOUNT, 0)
from EMPLOYEE E
left join INCENTIVES I ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID;

-- 53. Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join.

SELECT EMPLOYEE.FIRST_NAME, INCENTIVES.INCENTIVE_AMOUNT
FROM EMPLOYEE LEFT JOIN INCENTIVES ON EMPLOYEE.EMPLOYEE_ID = INCENTIVES.EMPLOYEE_REF_ID
WHERE INCENTIVES.INCENTIVE_AMOUNT IS NOT NULL
LIMIT 0, 1000;

-- 54. Select max incentive with respect to employee from employee and incentives table using subquery.

SELECT EMPLOYEE_REF_ID, INCENTIVE_AMOUNT FROM INCENTIVES
WHERE INCENTIVE_AMOUNT = (SELECT MAX(INCENTIVE_AMOUNT) 
FROM INCENTIVES);


-- 55. Select TOP 2 salary from employee table

SELECT DISTINCT salary
FROM employee
ORDER BY salary DESC
LIMIT 2;

-- 56. Select TOP N salary from employee table
SELECT DISTINCT salary
FROM employee
ORDER BY salary DESC
LIMIT 5;

-- 57. Select 2nd Highest salary from employee table

SELECT DISTINCT salary
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- 58. Select Nth Highest salary from employee table

SELECT DISTINCT salary
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 3;

