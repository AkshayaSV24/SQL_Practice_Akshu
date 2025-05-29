/*
Question4: What are the top skills based on Average salary?
-Look at the average salary associated with each skill for Data Analyst positions.
-Focuses on Data Analyst roles in India.
-Why? It reverals how different skills impact salary levels for Data Analysts and helps identify
the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg)) AS Avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location LIKE '%India%'
GROUP BY skills
ORDER BY Avg_salary DESC
LIMIT 10
;


/*

📌 Insights: Top Skills Based on Average Salary (India)
🥇 PostgreSQL, GitLab, PySpark, MySQL, and Linux top the list with an impressive ₹16.5 LPA (Lakhs per Annum) average salary — showcasing the power of combining database management, version control, big data processing, and OS-level skills.

🧠 Neo4j and GDPR follow closely, indicating demand for graph databases and data compliance expertise.

⚙️ Tools like Apache Airflow (₹13.8 LPA) reflect the growing importance of workflow automation in data pipelines.

🗄️ MongoDB and Databricks are valued highly, emphasizing the trend toward NoSQL databases and unified data analytics platforms.

💡 Overall, mastering data engineering and cloud-native tools seems to significantly boost salary potential for Data Analysts.
*/