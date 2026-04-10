--Start of project--
CREATE DATABASE student_performance_analysis;

--create table--
CREATE TABLE students_performance (
    gender TEXT,
    race_ethnicity TEXT,
    parental_level_of_education TEXT,
    lunch TEXT,
    test_preparation_course TEXT,
    math_score INT,
    reading_score INT,
    writing_score INT
);

--All data--
SELECT * FROM students_performance;

-- Data exploring--


-- 1. Overall Average Scores
SELECT 
    AVG(math_score) AS avg_math,
    AVG(reading_score) AS avg_reading,
    AVG(writing_score) AS avg_writing
FROM students_performance;

-- 2. Average Scores by Gender
SELECT 
    gender,
    AVG(math_score) AS avg_math,
    AVG(reading_score) AS avg_reading,
    AVG(writing_score) AS avg_writing
FROM students_performance
GROUP BY gender;

-- 3. Top 5 Students (by total score)
SELECT *,
       (math_score + reading_score + writing_score) AS total
FROM students_performance
ORDER BY total DESC
LIMIT 5;

-- 4. Average Score by Parental Education
SELECT 
    parental_level_of_education,
    AVG((math_score + reading_score + writing_score)/3.0) AS avg_total
FROM students_performance
GROUP BY parental_level_of_education
ORDER BY avg_total DESC;

-- 5. Lunch Impact
SELECT 
    lunch,
    AVG(math_score) AS avg_math,
    AVG(reading_score) AS avg_reading,
    AVG(writing_score) AS avg_writing
FROM students_performance
GROUP BY lunch;

-- 6. Test Preparation Impact
SELECT 
    test_preparation_course,
    AVG(math_score) AS avg_math,
    AVG(reading_score) AS avg_reading,
    AVG(writing_score) AS avg_writing
FROM students_performance
GROUP BY test_preparation_course;

-- 7. Rank All Students
SELECT *,
       (math_score + reading_score + writing_score) AS total,
       RANK() OVER (ORDER BY (math_score + reading_score + writing_score) DESC) AS rank
FROM students_performance;

-- 8. Top Student per Gender
SELECT *
FROM (
    SELECT *,
           (math_score + reading_score + writing_score) AS total,
           RANK() OVER (PARTITION BY gender ORDER BY (math_score + reading_score + writing_score) DESC) AS rnk
    FROM students_performance
) t
WHERE rnk = 1;

-- 9. Pass/Fail Classification
SELECT *,
    CASE 
        WHEN math_score >= 40 AND reading_score >= 40 AND writing_score >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS result
FROM students_performance;

-- 10. Grade Distribution (Math)
SELECT 
    CASE 
        WHEN math_score >= 90 THEN 'A'
        WHEN math_score >= 75 THEN 'B'
        WHEN math_score >= 50 THEN 'C'
        ELSE 'D'
    END AS grade,
    COUNT(*) AS count_students
FROM students_performance
GROUP BY grade
ORDER BY grade;

-- 11. Consistency Check
SELECT *,
       ABS(math_score - reading_score) AS diff_mr,
       ABS(reading_score - writing_score) AS diff_rw
FROM students_performance
ORDER BY (ABS(math_score - reading_score) + ABS(reading_score - writing_score));