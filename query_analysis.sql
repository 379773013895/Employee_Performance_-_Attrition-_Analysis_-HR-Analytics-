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
