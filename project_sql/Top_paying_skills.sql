/* Question: What are the skills for top paying data analyst jobs? */

WITH top_paying_jobs AS (

SELECT
jpf.job_id,
jpf.company_id,
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


LIMIT 20)


SELECT
    tpj.*,
    COALESCE(
        STRING_AGG(DISTINCT sd.skills, ', ' ORDER BY sd.skills),
        'No skills listed'
    ) AS skills
FROM
    top_paying_jobs AS tpj
    INNER JOIN skills_job_dim AS sjd ON tpj.job_id = sjd.job_id
    INNER JOIN skill_dim AS sd ON sd.skill_id = sjd.skill_id

GROUP BY
    tpj.job_id,
    tpj.company_id,
    tpj.job_title,
    tpj.job_location,
    tpj.job_schedule_type,
    tpj.salary_year_avg,
    tpj.job_posted_date
ORDER BY tpj.salary_year_avg DESC;