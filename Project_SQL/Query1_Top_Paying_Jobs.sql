/*
Question1: What are the top paying data analyst jobs?
-Identify the top 10 highest-paying Data Analyst jobs that are available in India.
-Focuses on job postings with specified salaries(remove nulls).
*/

SELECT
    job_title_short,
    job_location,
    company_dim.name AS company_name,
    salary_year_avg,
    job_schedule_type,    
    job_posted_date
    
FROM 
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id= company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%India%'AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
;


