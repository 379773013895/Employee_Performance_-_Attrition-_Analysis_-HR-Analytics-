CREATE DATABASE Employee_Performance; 

USE Employee_Performance;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    department_id INT,
    job_role VARCHAR(50),
    hire_date DATE,
    exit_date DATE,
    attrition VARCHAR(10)
);
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    monthly_salary DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY,
    employee_id INT,
    review_year INT,
    performance_rating INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
