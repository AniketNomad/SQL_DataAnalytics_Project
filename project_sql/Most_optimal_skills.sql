-- Most optimal skills to learn for Data Analyst job

SELECT sd.skills, COUNT(jpf.job_id) AS No_of_jobs,  ROUND(AVG(jpf.salary_year_avg),0) AS Average_salary
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title_short = 'Data Analyst' AND
jpf.salary_year_avg IS NOT NULL
GROUP BY  sd.skills
ORDER BY No_of_jobs DESC, Average_salary DESC
LIMIT 25;