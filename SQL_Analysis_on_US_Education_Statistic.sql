CREATE DATABASE US_education_data;

USE US_education_data;

-- 1. What is the average literacy (reading score) trend over time?
SELECT 
    YEAR,
    AVG(AVG_READING_8_SCORE) AS avg_literacy_score
FROM education_stats
WHERE AVG_READING_8_SCORE IS NOT NULL
GROUP BY YEAR
ORDER BY YEAR;

-- 2. Which states have highest average performance?
SELECT 
    STATE,
    AVG(AVG_MATH_8_SCORE) AS avg_math_score,
    AVG(AVG_READING_8_SCORE) AS avg_reading_score
FROM education_stats
WHERE AVG_MATH_8_SCORE IS NOT NULL
AND AVG_READING_8_SCORE IS NOT NULL
GROUP BY STATE
ORDER BY avg_math_score DESC;

-- 3. Calculate Funding Per Student
SELECT 
    STATE,
    YEAR,
    TOTAL_EXPENDITURE,
    ENROLL,
    (TOTAL_EXPENDITURE / ENROLL) AS funding_per_student
FROM education_stats
WHERE ENROLL IS NOT NULL
AND TOTAL_EXPENDITURE IS NOT NULL;
