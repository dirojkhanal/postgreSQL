CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    age INT,
    joining_date DATE
);

--Inserting Data into Tables
INSERT INTO employees (name, department, salary, age, joining_date) VALUES
('Ram', 'IT', 60000, 25, '2022-01-10'),
('Shyam', 'IT', 70000, 28, '2021-03-15'),
('Hari', 'HR', 45000, 30, '2020-07-22'),
('Sita', 'Finance', 80000, 32, '2019-11-05'),
('Gita', 'Finance', 75000, 29, '2022-05-18'),
('Ramesh', 'HR', 50000, 35, '2018-09-12'),
('Anita', 'IT', 65000, 27, '2023-02-20'),
('Kiran', 'Finance', 72000, 31, '2021-12-01');
-- Show tables
SELECT * FROM employees;
--Task 1 – WHERE Clause

--Show employees whose salary is greater than 60000.
select * from employees where salary>60000;

--Show employees whose department is IT.
SELECT * FROM employees WHERE department = 'IT';

--Show employees whose age is between 25 and 30.
SELECT * FROM employees where age BE

CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments (dept_name, location) VALUES
('IT', 'Kathmandu'),
('HR', 'Lalitpur'),
('Finance', 'Pokhara');

SELECT * FROM departments;


--INNER JOIN Tasks

Try to write queries for each of these:

️--Show all employees with their department location.

select e.name , e.department , e.salary , e.age , d.location from employees as e 
JOIN departments as d ON e.department = d.dept_name;

--Show employees in IT department only with their location.
SELECT e.name , d.location , e.department FROM employees e
JOIN 
departments d ON e.department = d.dept_name WHERE d.dept_name = 'IT';

--Show employees with salary > 60000 and include their department location.
SELECT e.name , e.salary , e.department , d.location FROM employees as e 
JOIN departments d ON e.department = d.dept_name WHERE salary >60000;

--Count how many employees are in each department along with location.
SELECT e.department, d.location, COUNT(*) AS total_employee
FROM employees e
JOIN departments d ON e.department = d.dept_name
GROUP BY e.department, d.location;

--Find total salary per department along with location.
SELECT e.department ,d.location ,sum(e.salary) as total_salary 
FROM employees e 
join departments as d on e.department =d.dept_name group by e.department , d.location;

--Show employees who joined after 2021 along with their department location.
SELECT e.name , d.location, e.joining_date FROM employees as e 
join departments as d ON e.department = d.dept_name WHERE e.joining_date > '2021-12-30';

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    age INT,
    joining_date DATE
);

--Inserting Data into Tables
INSERT INTO employees (name, department, salary, age, joining_date) VALUES
('Ram', 'IT', 60000, 25, '2022-01-10'),
('Shyam', 'IT', 70000, 28, '2021-03-15'),
('Hari', 'HR', 45000, 30, '2020-07-22'),
('Sita', 'Finance', 80000, 32, '2019-11-05'),
('Gita', 'Finance', 75000, 29, '2022-05-18'),
('Ramesh', 'HR', 50000, 35, '2018-09-12'),
('Anita', 'IT', 65000, 27, '2023-02-20'),
('Kiran', 'Finance', 72000, 31, '2021-12-01');
-- Show tables
SELECT * FROM employees;
--Task 1 – WHERE Clause

--Show employees whose salary is greater than 60000.
select * from employees where salary>60000;

--Show employees whose department is IT.
SELECT * FROM employees WHERE department = 'IT';

--Show employees whose age is between 25 and 30.
SELECT * FROM employees where age BE

CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments (dept_name, location) VALUES
('IT', 'Kathmandu'),
('HR', 'Lalitpur'),
('Finance', 'Pokhara');

SELECT * FROM departments;

CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(50),
    dept_id INT
);

--MANY TO MANY RELATIONS 
CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT
);

INSERT INTO projects (project_name, dept_id) VALUES
('Website Development',1),
('Recruitment System',2),
('Accounting Software',3);

INSERT INTO employee_projects VALUES
(1,1),
(2,1),
(3,2),
(6,2),
(4,3),
(5,3);

SELECT * FROM employee_projects ;

-- Task 1 (Show employee name, department name, and department location.)
select e.name , e.department , d.location from employees as e
JOIN departments as d ON d.dept_name = e.department;

-- Task 2
-- Show employee name and the project they are working on.
SELECT e.name , p.project_name from employees as e 
JOIN employee_projects as ep ON e.emp_id = ep.emp_id
JOIN projects as p ON ep.project_id = p.project_id;


-- Task 3
-- Show employee name, department name, and project name.
select e.name , e.department , p.project_name from employees as e 
join employee_projects as ep on e.emp_id = ep.emp_id
JOIN projects as p ON ep.project_id = p.project_id;


-- Task 
-- Show project name, department name, and location.
SELECT p.project_name , d.dept_name ,d.location from departments as d
JOIN projects as p ON d.dept_id = p.dept_id;



-- Task 5 
-- Show each department and the total number of employees working on projects.

SELECT e.department , sum(e.emp_id) as total_employees from employees as e 
join employee_projects ep ON e.emp_id = ep.emp_id 
JOIN projects as p ON ep.project_id = p.project_id group by e.department;




















