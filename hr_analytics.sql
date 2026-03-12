-- ============================================================
-- HR Analytics — SQL Analysis Project
-- Author: Himanshu Chavhan
-- Tool: MySQL
-- Dataset: HRDataset_v14.csv (Kaggle)
-- ============================================================

CREATE DATABASE IF NOT EXISTS hr_analytics;
USE hr_analytics;

-- Q1. TOTAL EMPLOYEES BY DEPARTMENT
SELECT 
    Department,
    COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY Department
ORDER BY Total_Employees DESC;

-- Q2. ATTRITION RATE BY DEPARTMENT
SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Termd = 1 THEN 1 ELSE 0 END) AS Terminated,
    ROUND(SUM(CASE WHEN Termd = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Pct
FROM hr_data
GROUP BY Department
ORDER BY Attrition_Rate_Pct DESC;

-- Q3. AVERAGE SALARY BY POSITION
SELECT 
    Position,
    COUNT(*) AS Employees,
    ROUND(AVG(Salary), 2) AS Avg_Salary,
    ROUND(MIN(Salary), 2) AS Min_Salary,
    ROUND(MAX(Salary), 2) AS Max_Salary
FROM hr_data
GROUP BY Position
ORDER BY Avg_Salary DESC
LIMIT 10;

-- Q4. GENDER DISTRIBUTION BY DEPARTMENT
SELECT 
    Department,
    SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) AS Male,
    SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) AS Female,
    COUNT(*) AS Total,
    ROUND(SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Female_Pct
FROM hr_data
GROUP BY Department
ORDER BY Female_Pct DESC;

-- Q5. TOP 10 HIGHEST PAID EMPLOYEES
SELECT 
    EmpID,
    Position,
    Department,
    Salary,
    Sex
FROM hr_data
ORDER BY Salary DESC
LIMIT 10;

-- Q6. AVERAGE SALARY BY DEPARTMENT
SELECT 
    Department,
    ROUND(AVG(Salary), 2) AS Avg_Salary
FROM hr_data
GROUP BY Department
ORDER BY Avg_Salary DESC;

-- Q7. PERFORMANCE SCORE BY DEPARTMENT
SELECT 
    Department,
    PerformanceScore,
    COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY Department, PerformanceScore
ORDER BY Department, Total_Employees DESC;

-- Q8. RECRUITMENT SOURCE EFFECTIVENESS
SELECT 
    RecruitmentSource,
    COUNT(*) AS Total_Hired,
    ROUND(AVG(Salary), 2) AS Avg_Salary,
    SUM(CASE WHEN Termd = 1 THEN 1 ELSE 0 END) AS Terminated,
    ROUND(SUM(CASE WHEN Termd = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Pct
FROM hr_data
GROUP BY RecruitmentSource
ORDER BY Attrition_Pct ASC;

-- Q9. GENDER PAY GAP
SELECT 
    Sex,
    COUNT(*) AS Employees,
    ROUND(AVG(Salary), 2) AS Avg_Salary,
    ROUND(MIN(Salary), 2) AS Min_Salary,
    ROUND(MAX(Salary), 2) AS Max_Salary
FROM hr_data
GROUP BY Sex;

-- Q10. EMPLOYEES BY RACE
SELECT 
    RaceDesc,
    COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY RaceDesc
ORDER BY Total_Employees DESC;

-- Q11. ABSENTEEISM BY DEPARTMENT
SELECT 
    Department,
    ROUND(AVG(Absences), 1) AS Avg_Absences,
    MAX(Absences) AS Max_Absences,
    COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY Department
ORDER BY Avg_Absences DESC;

-- Q12. SALARY BY MARITAL STATUS
SELECT 
    MaritalDesc,
    COUNT(*) AS Employees,
    ROUND(AVG(Salary), 2) AS Avg_Salary
FROM hr_data
GROUP BY MaritalDesc
ORDER BY Avg_Salary DESC;