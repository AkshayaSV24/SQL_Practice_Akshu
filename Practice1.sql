WITH Remote_Jobs AS(
SELECT 
    skills_job_dim.skill_id,
    COUNT(*) AS Skill_Count       
FROM skills_job_dim
INNER JOIN job_postings_fact
    ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE 
    job_work_from_home = TRUE
GROUP BY skill_id
)

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    Remote_Jobs.Skill_Count
FROM skills_dim
RIGHT JOIN Remote_Jobs 
    ON Remote_Jobs.skill_id = skills_dim.skill_id
ORDER BY Skill_Count DESC
LIMIT 5 ;






