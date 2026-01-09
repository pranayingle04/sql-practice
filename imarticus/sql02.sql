#find emp whoes salary is above the avg salary 
SELECT * FROM employees HAVING salary > (SELECT AVG(salary) FROM employees); 

#RANK EMP BY SALARY 
SELECT * FROM employees order by salary DESC;

SELECT *, RANK()OVER (ORDER BY salary DESC) AS rank_sal FROM employees;

#GET EMPLOYEES WHO WORK IN THE DEPARTMENT AS AMIT SHARMA 
SELECT * FROM employees WHERE department = (SELECT department FROM employees WHERE first_name = "Amit" AND last_name = "Sharma");

#FIND THE SECOND HIGHEST SALARY 
SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees));

select * from employees order by salary desc limit 1,1;

# display each emp work in dffrent city with count 
SELECT city, count(*) FROM employees group by city;

SELECT department, count(*) FROM employees group by department;

# retirve the emp who joined in first quater jan to march 
SELECT * FROM employees WHERE MONTH(join_date) BETWEEN 1 AND 3;

#FIND EMP WITH SAME SALARY 
SELECT salary, COUNT(salary) as count_sal FROM employees group by salary order by count_sal desc;

select salary, count(*) from employees group by salary having count(*)>1; 

# identify emp who are below their dept avg 
SELECT e.* from employees e 
join (select department, avg(salary) as dept_avg from 
employees group by department) d on 
e.department = d.department where e.salary < d.dept_avg;

select department, avg(salary) as dept_avg from 
employees group by department;

#CREATE VIEW OF EMP IN IT DEPT
CREATE VIEW new_v AS 
SELECT salary, department FROM employees;

SELECT * FROM new_v;
