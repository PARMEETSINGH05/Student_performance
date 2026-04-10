# 📊 Student Performance Analysis (SQL Project)

## 📌 Overview

This project analyzes student performance data using PostgreSQL.\
The dataset includes information about gender, race/ethnicity, parental
education, lunch type, test preparation, and subject scores.

------------------------------------------------------------------------

## 🗂️ Dataset

Columns included: - gender - race_ethnicity -
parental_level_of_education - lunch - test_preparation_course -
math_score - reading_score - writing_score

------------------------------------------------------------------------

## 🏗️ Table Creation

``` sql
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
```

------------------------------------------------------------------------

## 📥 Data Import

``` sql
\COPY students_performance
FROM 'path/to/StudentsPerformance.csv'
DELIMITER ','
CSV HEADER;
```

------------------------------------------------------------------------

## 📊 Key Analyses

-   Overall average scores
-   Performance by gender
-   Top performing students
-   Impact of parental education
-   Lunch type analysis
-   Test preparation impact
-   Student ranking using window functions
-   Pass/Fail classification
-   Grade distribution
-   Consistency analysis

------------------------------------------------------------------------

## 🧠 Key Insights

-   Test preparation improves scores
-   Standard lunch students perform better
-   Female students excel in reading/writing
-   Math scores vary the most

------------------------------------------------------------------------

## 🛠️ Tools Used

-   PostgreSQL
-   SQL

------------------------------------------------------------------------

## 🚀 Learning Outcomes

-   SQL aggregation functions
-   GROUP BY and filtering
-   Window functions (RANK)
-   Real-world data analysis

------------------------------------------------------------------------

## 📌 Conclusion

This project demonstrates how SQL can be used to extract insights from
raw data and perform meaningful analysis.
