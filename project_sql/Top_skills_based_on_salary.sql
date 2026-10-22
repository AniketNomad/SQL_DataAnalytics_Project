--What are the top skills based on salary for data analytics role?

-- Approach 1


WITH Top_skills_salary_wise AS (
SELECT  ROUND(AVG(jpf.salary_year_avg),0) AS Average_salary, sjd.skill_id

FROM job_postings_fact jpf
INNER JOIN skills_job_dim AS sjd ON sjd.job_id = jpf.job_id

WHERE jpf.job_title_short = 'Data Analyst' AND salary_year_avg IS NOT Null

GROUP BY sjd.skill_id
)

SELECT Tssw.*, sd.skills

FROM Top_skills_salary_wise Tssw
INNER JOIN skills_dim sd ON sd.skill_id = Tssw.skill_id

ORDER BY Average_salary DESC
LIMIT 10; 

-- Approach 2

/*SELECT skills, ROUND(AVG(jpf.salary_year_avg),0) AS Average_salary

FROM job_postings_fact jpf
INNER JOIN skills_job_dim AS sjd ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id

WHERE jpf.job_title_short = 'Data Analyst' AND salary_year_avg IS NOT Null

GROUP BY skills

ORDER BY Average_salary DESC
LIMIT 10; */