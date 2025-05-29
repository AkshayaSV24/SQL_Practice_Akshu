/*
Question5: What are the most optimal skills to learn(ie which is in high demand and a high paying skill)?
-Identify skills in high demand and associated with high average salaries for Data Analyst roles.
-Concentrates on remote positions with specified salaries
-Why? Targets skills that offer job security(high demand) and financial benefits(high salaries),
offering strategic insights for career development in data analysis.
*/

WITH Demanding_skills AS (
SELECT 
    skills_dim.skill_id,
    skills,
    COUNT(skills_job_dim.job_id) AS Demand_Count
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home IS TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id, skills
),

High_Paying_skills AS(
SELECT 
    skills_dim.skill_id,
    ROUND(AVG(salary_year_avg)) AS Avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
     job_work_from_home IS TRUE
GROUP BY skills_dim.skill_id
)

SELECT 
    Demanding_skills.skill_id,
    Demanding_skills.skills,
    Demand_Count,
    Avg_salary
FROM
    Demanding_skills
INNER JOIN High_Paying_skills 
    ON Demanding_skills.skill_id = High_Paying_skills.skill_id
ORDER BY Avg_salary DESC, Demand_Count DESC
LIMIT 10
;