WITH top_skills AS (
SELECT
sjd.skill_id,
COUNT (sjd.skill_id) AS No_of_jobs

FROM
skills_job_dim AS sjd
INNER JOIN job_postings_fact AS jpf ON jpf.job_id = sjd.job_id

WHERE
    jpf.job_title_short LIKE '%Data%Analyst%'

GROUP BY
    skill_id
)

SELECT
sd.skill_id,
sd.skills,
ts.No_of_jobs

FROM
skills_dim AS sd
INNER JOIN top_skills AS ts ON ts.skill_id = sd.skill_id

ORDER BY
No_of_jobs DESC;