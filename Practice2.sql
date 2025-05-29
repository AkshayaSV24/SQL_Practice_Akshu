WITH Total_no_of_jobs AS (
    SELECT company_id,
    COUNT(*) AS No_of_postings
FROM
    job_postings_fact
    GROUP BY 
        company_id
)

SELECT 
    company_dim.name AS company_name,
    Total_no_of_jobs.No_of_postings    
FROM Total_no_of_jobs
RIGHT JOIN company_dim ON Total_no_of_jobs.company_id = company_dim.company_id
ORDER BY No_of_postings DESC
;