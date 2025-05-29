/*
Question3: What are the most in-demand skills for data analyst jobs?
-Join job postings inner join table similar to query 2.
-Identify the top 5 in-demand skills for a data analyst.
-Focus on all job locations.
-Why? Retrieves the top 5 skills with the highest demand in the job market, 
providing insights into the most valuable skills.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS Demand_Count
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
GROUP BY skills
ORDER BY Demand_Count DESC
LIMIT 5
;

/*
📌 Insights: Most In-Demand Skills for Data Analysts
🥇 SQL is the most in-demand skill by a wide margin, with over 92,000 job listings mentioning it — a must-have for any data analyst.

📊 Excel remains highly relevant, showing that spreadsheet proficiency is still critical in the data workflow.

🐍 Python holds strong in third place, emphasizing the importance of programming and automation in modern analytics.

📉 Tableau and Power BI are key visualization tools, highlighting the value of data storytelling and dashboarding in business intelligence roles.
*/