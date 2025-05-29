/*
Question2: What skills are required for the top paying data analyst jobs?
-Use the top 10 highest paying Data Analyst jobs from first query
-Add the specific skills required for these roles
-Why? It provides a detailed look at which high paying jobs demand certain skills, 
helping me understand which skills to develop that align with top salaries
*/


WITH top_paying_jobs AS(
SELECT
    job_id,
    job_title_short,
    job_location,
    company_dim.name AS company_name,
    salary_year_avg    
FROM 
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id= company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%India%' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC
;


/*
🔍 Insights:
- SQL is the most in-demand skill in this dataset.
- Oracle, MongoDB, and Power BI are also very popular, showing demand for database and visualization tools.
- There’s a good mix of programming (Python, Scala) and cloud/big data tools (AWS, Spark, Databricks).
*/