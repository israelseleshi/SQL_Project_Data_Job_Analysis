/*

Question: What are the top skills based on salary?

    - Look at the average salary associated with each skill for Data Analyst positions

    - Focuses on roles with specified salaries, regardless of location

    - Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve

*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = true
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;


/*

💼 Top-Paying Data Analyst Skills
These high-paying skills reflect the evolving role of data analysts into more technical and cross-functional positions:

Big Data & Cloud Tools – Skills like PySpark, Databricks, and GCP are in demand for scalable data processing and cloud-native analytics.

ML & Automation Platforms – Tools such as DataRobot, Watson, and scikit-learn highlight the value of predictive modeling and AI.

DevOps & Engineering Practices – Proficiency with GitLab, Bitbucket, and Jenkins enables smoother data pipeline deployment and collaboration.

Programming & Advanced Analytics – Mastery of Pandas, Numpy, Swift, or Golang allows deeper insights and integration into applications.

*/