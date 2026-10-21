/* Question: What are the top paying data analyst jobs? */

SELECT
jpf.job_id,
cd.name AS company_name,
jpf.job_title,
jpf.job_location,
jpf.job_schedule_type,
jpf.salary_year_avg,
jpf.job_posted_date

FROM
job_postings_fact AS jpf
LEFT JOIN company_dim AS cd ON jpf.company_id = cd.company_id

WHERE
job_title_short = 'Data Analyst' AND
(job_location LIKE '%Anywhere%' OR job_location LIKE '%Germany%') AND
salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC


LIMIT 20;