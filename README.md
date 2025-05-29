# 📊 Data Analyst Career Insights
## 🚀 Project Focus:
This project dives into the world of Data Analyst roles, exploring key trends and insights to help professionals and aspirants navigate the job market.

## 🔍 What You'll Find:
💰 Top-Paying Data Analyst Roles
Discover which job titles and sectors offer the highest salaries.

🧠 Most In-Demand Skills
Explore the tools, technologies, and skills employers are actively seeking.

🎯 High Demand + High Salary Intersection
Identify the sweet spot where strong demand meets high compensation.

## 🌐 Purpose:
To empower data professionals with actionable insights to shape their career paths, skill development, and job search strategy in the data analytics field.

## 🧾 SQL Queries
🔍 Dive into the core logic of the analysis with well-structured SQL queries.

📂 Check them out here:
👉 [Project-SQL folder](/Project_SQL)

## ✅ Project Requirements & Key Questions
This project answers essential questions related to Data Analyst careers, focusing on salary trends, skill demand, and optimal learning paths.

### **🧠 Key Questions Answered:**

💰 What are the top paying Data Analyst jobs?

Gain insights into roles offering the highest salaries in the industry.

🛠 What skills are required for the top paying Data Analyst jobs?

Discover which tools and competencies are most commonly needed for these high-paying roles.

📈 What are the most in-demand skills for Data Analyst jobs?

Identify the skills employers are frequently seeking in job listings.

📊 What are the top skills based on average salary?

Analyze which skills are associated with the highest average pay.

🎯 What are the most optimal skills to learn?

Find the sweet spot: skills that are both in high demand and linked to high salaries.

## 🛠️ Tools Used
- **SQL** – Backbone of the analysis, used to query the database and extract insights.

- **PostgreSQL** – Chosen DBMS, ideal for managing and analyzing job posting data.

- **Visual Studio Code** – User-friendly IDE for writing and executing SQL queries.

- **Git & GitHub** – Used for version control and sharing SQL scripts, enabling collaboration and project tracking.

## 📈 Analysis

## 💰 1. Top Paying Jobs

This query identifies the top 10 highest-paying Data Analyst jobs in India. It filters job postings to include only those with a specified salary and excludes any entries with null salary data. The result highlights key details such as job location, schedule type, and posting date to provide deeper context.

```sql
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
```

### 📌 Insights: Top-Paying Data Analyst Jobs in India

💼 ServiceNow offers the highest average salary for ***Data Analyst*** roles in India, at $177,283/year, based in Hyderabad.

🌆***Hyderabad and Bengaluru*** are key cities for high-paying analyst positions, featuring multiple top listings.

🏢 Companies like ***Bosch Group, Eagle Genomics Ltd, and Srijan Technologies*** appear multiple times among the top-paying employers.

⏰ All roles listed are full-time, reflecting a consistent job type across top-paying positions.

## 🧠2. Skills Required for Top-Paying Data Analyst Jobs

This query identifies the key skills associated with the top 10 highest-paying Data Analyst roles in India. It first selects the top-paying jobs (excluding null salaries), then joins with skills_job_dim and skills_dim to retrieve the skills linked to those roles.

```sql
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
```

### 🔍 Insights:

🏆 ***SQL*** is the most consistently listed skill, confirming its critical role in top-paying Data Analyst roles.

🗄️ ***Oracle, MongoDB, and Power BI*** show high demand, highlighting the need for strong database and data visualization expertise.

🐍 ***Python and Scala*** appear among top-paying roles, indicating value in programming capabilities.

☁️ AWS, Databricks, and Apache Spark show growing relevance of cloud and big data technologies.

🧪 ETL tools and data pipeline technologies are present, signaling the importance of data engineering skills.

## 📊 3. Most In-Demand Skills for Data Analyst Jobs

This query identifies the top 5 most in-demand skills across all Data Analyst job postings, regardless of location. By joining job and skill tables, it counts how frequently each skill appears. The results highlight which skills employers are seeking the most in the current job market.

```sql
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
```

### 📌 Insights: Most In-Demand Skills for Data Analysts

🥇 ***SQL*** is the most in-demand skill by a wide margin, with over 92,000 job listings mentioning it — a must-have for any data analyst.

📊 ***Excel*** remains highly relevant, showing that spreadsheet proficiency is still critical in the data workflow.

🐍 ***Python*** holds strong in third place, emphasizing the importance of programming and automation in modern analytics.

📉 ***Tableau and Power BI*** are key visualization tools, highlighting the value of data storytelling and dashboarding in business intelligence roles.

## 💼 4. Top Skills Based on Average Salary

This query identifies the top 10 skills associated with the highest average salaries for Data Analyst roles in India. By linking job postings to their required skills, it calculates how each skill correlates with salary levels.

```sql
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
```

### 📌 Insights: Top Skills Based on Average Salary (India)

🥇 ***PostgreSQL, GitLab, PySpark, MySQL, and Linux*** top the list with an impressive ₹16.5 LPA (Lakhs per Annum) average salary — showcasing the power of combining database management, version control, big data processing, and OS-level skills.

🧠 Neo4j and GDPR follow closely, indicating demand for graph databases and data compliance expertise.

⚙️ Tools like Apache Airflow (₹13.8 LPA) reflect the growing importance of workflow automation in data pipelines.

🗄️ MongoDB and Databricks are valued highly, emphasizing the trend toward NoSQL databases and unified data analytics platforms.

## 🚀 5. Most Optimal Skills to Learn (High Demand + High Salary)

This query identifies the top 10 optimal skills for Data Analysts by evaluating both market demand and average salary, focusing exclusively on remote roles with specified salaries. It combines two CTEs — one for skill demand and another for salary averages — and merges them to surface the best strategic skills.

```sql
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
```

### 📌 Insights: Most Optimal Skills to Learn (Remote Data Analyst Roles)

💰 ***PySpark*** leads the list with the highest average salary (₹208K) — a strong indicator of the value of big data processing skills in remote analytics roles.

💻 ***Bitbucket and GitLab*** appear prominently, showing that version control tools are not only in demand but also well-compensated.

🧠 AI/ML-related platforms like ***Watson and DataRobot*** command high pay, reflecting a growing need for automation and intelligent systems knowledge.

🛠️ Skills like ***Jupyter, Swift, and Pandas*** represent a solid mix of data science tools and programming capabilities, making them versatile for various analytics workflows.

## 🧠 What I Learned

***Advanced SQL Techniques***: Gained hands-on experience with complex SQL operations including JOINs, CTEs, GROUP BY, filtering with WHERE, and aggregations (COUNT, AVG, ROUND) to derive actionable insights from real-world job market data.

***Data Relationship Handling***: Strengthened understanding of relational databases by effectively linking multiple dimension tables (e.g., skills_dim, company_dim) with fact tables using primary-foreign key relationships for enriched analysis.

***Insight-Driven Query Building***: Learned how to frame and optimize SQL queries to answer targeted business questions — such as identifying top-paying roles, in-demand skills, and strategic upskilling opportunities — using clean, modular query logic.

## 🌐 Overall Insight

💼 Top-paying Data Analyst jobs in India are offered by companies like ***ServiceNow, Bosch, and Eagle Genomics***, with salaries exceeding ₹1.7L per annum.

📊 Most in-demand skills include ***SQL, Excel, Python, Tableau, and Power BI*** — forming the core toolkit for data analysts across industries.

🚀 High-paying niche skills such as ***PySpark, GitLab, Bitbucket, and DataRobot*** show great salary potential in remote roles, indicating a trend toward specialized analytical technologies.

# ✅ Conclusion

This project significantly enhanced my SQL skills and offered valuable insights into the data analyst job market. The findings serve as a practical guide for prioritizing both skill development and job search strategies. For aspiring data analysts, focusing on high-demand and high-paying skills can lead to better career opportunities and long-term growth in the field.









