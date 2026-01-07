CREATE DATABASE IM25;
USE IM25;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    join_date DATE,
    city VARCHAR(50)
);

INSERT INTO employees (emp_id, first_name, last_name, department, salary, join_date, city) VALUES
(1, 'Amit', 'Sharma', 'Sales', 45000, '2021-01-12', 'Mumbai'),
(2, 'Priya', 'Patil', 'HR', 52000, '2020-11-05', 'Pune'),
(3, 'Rohan', 'Desai', 'IT', 70000, '2019-04-18', 'Delhi'),
(4, 'Sneha', 'Kulkarni', 'Finance', 65000, '2022-03-09', 'Nashik'),
(5, 'Vikas', 'Naik', 'Sales', 48000, '2021-07-22', 'Mumbai'),
(6, 'Kiran', 'Joshi', 'IT', 72000, '2020-02-14', 'Bangalore'),
(7, 'Meera', 'Shetty', 'HR', 54000, '2019-06-30', 'Chennai'),
(8, 'Suresh', 'Kale', 'Marketing', 50000, '2021-09-11', 'Pune'),
(9, 'Ananya', 'Gore', 'Finance', 62000, '2020-12-25', 'Mumbai'),
(10, 'Rahul', 'Chopra', 'IT', 75000, '2018-10-10', 'Delhi'),
(11, 'Divya', 'Rane', 'Sales', 46000, '2022-08-15', 'Mumbai'),
(12, 'Arjun', 'Jadhav', 'Operations', 58000, '2021-02-18', 'Nagpur'),
(13, 'Nisha', 'Sawant', 'HR', 53000, '2019-11-27', 'Pune'),
(14, 'Harsh', 'Pandey', 'IT', 78000, '2020-03-03', 'Bangalore'),
(15, 'Preeti', 'Mhatre', 'Finance', 64000, '2021-06-14', 'Mumbai'),
(16, 'Tanmay', 'Yadav', 'Sales', 47000, '2022-01-19', 'Nashik'),
(17, 'Rita', 'More', 'Marketing', 51000, '2021-05-21', 'Pune'),
(18, 'Deepak', 'Mishra', 'Operations', 60000, '2020-08-08', 'Delhi'),
(19, 'Sanjana', 'Khan', 'HR', 55000, '2022-03-25', 'Chennai'),
(20, 'Mahesh', 'Patel', 'IT', 77000, '2019-12-30', 'Bangalore'),
(21, 'Komal', 'Deshmukh', 'Finance', 63000, '2021-04-13', 'Mumbai'),
(22, 'Imran', 'Shaikh', 'Sales', 49000, '2022-06-07', 'Pune'),
(23, 'Sakshi', 'Pawar', 'Marketing', 52000, '2020-01-29', 'Mumbai'),
(24, 'Ajay', 'Thakur', 'Operations', 59000, '2021-08-20', 'Nagpur'),
(25, 'Mohan', 'Gupta', 'HR', 56000, '2019-05-15', 'Delhi'),
(26, 'Neha', 'Tiwari', 'IT', 80000, '2020-07-11', 'Bangalore'),
(27, 'Tarun', 'Bansal', 'Finance', 66000, '2021-09-09', 'Chennai'),
(28, 'Vidya', 'Dixit', 'Sales', 48000, '2022-02-10', 'Pune'),
(29, 'Gaurav', 'Kulkarni', 'Marketing', 53000, '2020-05-23', 'Mumbai'),
(30, 'Jaya', 'Mistry', 'HR', 55000, '2019-09-10', 'Nagpur'),
(31, 'Ravi', 'Purohit', 'IT', 76000, '2021-01-07', 'Bangalore'),
(32, 'Ankit', 'Chavan', 'Operations', 61000, '2020-10-28', 'Mumbai'),
(33, 'Kajal', 'Gavande', 'Finance', 65000, '2022-04-01', 'Pune'),
(34, 'Farhan', 'Ansari', 'Sales', 47000, '2021-11-16', 'Mumbai'),
(35, 'Jatin', 'Rathod', 'Marketing', 54000, '2020-03-19', 'Chennai'),
(36, 'Leena', 'Kadam', 'HR', 56000, '2019-02-11', 'Pune'),
(37, 'Parth', 'Bhatt', 'IT', 81000, '2020-09-14', 'Delhi'),
(38, 'Asmita', 'Kamble', 'Finance', 68000, '2021-05-31', 'Mumbai'),
(39, 'Yogesh', 'Gaikwad', 'Operations', 62000, '2022-07-20', 'Nagpur'),
(40, 'Swati', 'Nair', 'Marketing', 52000, '2021-10-05', 'Chennai'),
(41, 'Omkar', 'Lokhande', 'IT', 79000, '2020-06-27', 'Bangalore'),
(42, 'Rashmi', 'Verma', 'HR', 54000, '2019-08-16', 'Delhi'),
(43, 'Sahil', 'Bora', 'Sales', 46000, '2021-04-07', 'Pune'),
(44, 'Monica', 'Rajput', 'Finance', 67000, '2020-12-18', 'Mumbai'),
(45, 'Vipul', 'Solanki', 'IT', 82000, '2018-11-14', 'Chennai'),
(46, 'Trupti', 'Bhise', 'Marketing', 51000, '2021-03-11', 'Pune'),
(47, 'Nilesh', 'Bendre', 'Operations', 63000, '2022-05-08', 'Mumbai'),
(48, 'Pooja', 'Salian', 'HR', 55000, '2020-09-21', 'Delhi'),
(49, 'Ashish', 'More', 'Sales', 48000, '2021-12-30', 'Mumbai'),
(50, 'Rekha', 'Shukla', 'Finance', 69000, '2022-03-18', 'Pune');

SHOW TABLES;

DESC employees; 

#SHOW ALL THE EMPLOYEES DATA
SELECT * FROM employees;

#LIST ALL THE EMP FROM DEPT FINANACE 
SELECT * FROM employees WHERE department="Finance";

#retrive the details of emp befoore 2020
SELECT * FROM employees WHERE join_date < '2020-01-01';

#display unique dept
SELECT DISTINCT department FROM employees; 

#COUNT HOW MANY EMPLOYEES ARE FROM MUMBAI 
SELECT COUNT(join_date) AS TOTAL_EMP_FORM_MUMBAI FROM employees WHERE city = "Mumbai";

#find the avg salary of employees 
SELECT AVG(salary) as AVERAGE_SALARY FROM employees;

#maximum salaary 
SELECT MAX(salary) AS MAXI_SAL FROM employees;

SELECT MIN(salary) AS MANI_SAL FROM employees;

SELECT SUM(salary) AS TOTAL_SAL FROM employees;

#FIND AVG SALARY OF EACH DEPT 
SELECT department, AVG(salary) as AVERAGE_SALARY FROM employees group by department;

SELECT department, AVG(salary) as AVERAGE_SALARY FROM employees group by department order by AVERAGE_SALARY desc;

#find the highest paid emp in it 
SELECT * FROM employees WHERE department = "IT" order by salary desc limit 1;

#display top 5 
SELECT * FROM employees order by salary desc limit 5;

#list emp whes name statrt from a
SELECT * FROM employees where first_name like "A%";

#display emp whoes salaey betwwen 50000 and 70000
SELECT * FROM employees WHERE salary BETWEEN 50000 AND 70000;

# JOIN DATE 2021 
SELECT * FROM employees where year(join_date) = 2021;

