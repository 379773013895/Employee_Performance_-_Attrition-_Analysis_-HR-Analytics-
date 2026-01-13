-- Sample Advanced SQL Queries
-- Attrition Rate
SELECT 
ROUND(
(SUM(CASE WHEN attrition='Yes' 
THEN 1 ELSE 0 END)*100.0)/COUNT(*),2) AS attrition_rate_percentage
FROM employees;

-- Department-Wise Attrition
SELECT d.department_name,
COUNT(e.employee_id) AS attrition_count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.attrition='Yes'
GROUP BY d.department_name;

--  Salary vs Performance
SELECT pr.performance_rating,
AVG(s.monthly_salary) AS avg_salary
FROM performance_reviews pr
JOIN salaries s ON pr.employee_id = s.employee_id
GROUP BY pr.performance_rating;

--  Gender Pay Gap
SELECT e.gender,
AVG(s.monthly_salary) AS avg_salary
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY e.gender;

--  High-Risk Attrition Employees
SELECT e.employee_name, pr.performance_rating, s.monthly_salary
FROM employees e
JOIN performance_reviews pr ON e.employee_id = pr.employee_id
JOIN salaries s ON e.employee_id = s.employee_id
WHERE pr.performance_rating <= 2;

--  Overall Attrition Rate
SELECT 
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS attrition_rate_percentage
FROM employees;

--  Department-wise Attrition Rate
SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS attrition_rate
FROM employees
GROUP BY department;

-- 3Attrition by Job Role
SELECT 
    job_role,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY job_role
ORDER BY attrition_count DESC;

--  Average Performance Rating by Department
SELECT 
    department,
    ROUND(AVG(performance_rating), 2) AS avg_performance_rating
FROM employees
GROUP BY department;

--  Salary vs Attrition
SELECT 
    attrition,
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY attrition;

-- Experience Level Attrition Analysis
SELECT 
    experience_level,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY experience_level;

-- Job Satisfaction vs Attrition
SELECT 
    job_satisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY job_satisfaction
ORDER BY job_satisfaction;

-- Top 5 Departments by Attrition Rate
SELECT 
    department,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS attrition_rate
FROM employees
GROUP BY department
ORDER BY attrition_rate DESC
LIMIT 5;

-- High-Risk Employees (Low Performance + Low Satisfaction)
SELECT 
    employee_id,
    department,
    job_role,
    performance_rating,
    job_satisfaction
FROM employees
WHERE performance_rating <= 2
  AND job_satisfaction <= 2;

-- Department Performance Ranking (Window Function)
SELECT 
    department,
    ROUND(AVG(performance_rating), 2) AS avg_rating,
    RANK() OVER (ORDER BY AVG(performance_rating) DESC) AS performance_rank
FROM employees
GROUP BY department;

