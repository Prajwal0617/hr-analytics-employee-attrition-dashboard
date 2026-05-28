USE hr_analytics;
SELECT COUNT(*) AS Total_Employees
FROM employees;
SELECT COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition = 'Yes';
SELECT Department,
       COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY Attrition_Count DESC;
SELECT Department,
       ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM employees
GROUP BY Department;
SELECT OverTime,
       COUNT(*) AS Employees
FROM employees
GROUP BY OverTime;
SELECT JobSatisfaction,
       COUNT(*) AS Employees
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;
SELECT Gender,
       COUNT(*) AS Employees
FROM employees
GROUP BY Gender;
SELECT `Age Group`,
       COUNT(*) AS Employees
FROM employees
GROUP BY `Age Group`;
SELECT JobRole,
       ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM employees
GROUP BY JobRole
ORDER BY Avg_Salary DESC;
SELECT JobRole,
       MonthlyIncome,
       RANK() OVER(
           ORDER BY MonthlyIncome DESC
       ) AS Salary_Rank
FROM employees;
WITH dept_salary AS (
    SELECT Department,
           AVG(MonthlyIncome) AS AvgSalary
    FROM employees
    GROUP BY Department
)

SELECT *
FROM dept_salary
ORDER BY AvgSalary DESC;