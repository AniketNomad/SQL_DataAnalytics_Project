/*CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    Custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

SELECT * FROM job_applied;

INSERT INTO job_applied 
    (job_id, 
    application_sent_date, 
    Custom_resume, 
    resume_file_name, 
    cover_letter_sent, 
    cover_letter_file_name, 
    status)
VALUES 
    (1, '2024-01-15', TRUE, 'custom_resume_1.pdf', TRUE, 'cover_letter_1.pdf', 'Submitted'),
    (2, '2024-02-20', FALSE, 'default_resume.pdf', FALSE, NULL, 'Pending'),
    (3, '2024-03-05', TRUE, 'custom_resume_2.pdf', TRUE, 'cover_letter_2.pdf', 'Interview Scheduled'),
    (4, '2024-04-10', FALSE, 'default_resume.pdf', FALSE, NULL, 'Rejected'),
    (5, '2024-05-25', TRUE, 'custom_resume_3.pdf', TRUE, 'cover_letter_3.pdf', 'Offer Received');


SELECT * FROM job_applied;

ALTER TABLE job_applied
ADD recruiter_name VARCHAR(100), 
ADD contact VARCHAR(100);

UPDATE job_applied
SET recruiter_name = 'John Doe', contact = 'john.doe@company.com'
WHERE job_id = 1;

UPDATE job_applied
SET recruiter_name = 'Jane Smith', contact = 'jane.smith@company.com'
WHERE job_id = 2;

UPDATE job_applied
SET recruiter_name = 'Michael Johnson', contact = 'michael.johnson@company.com'
WHERE job_id = 3;

UPDATE job_applied
SET recruiter_name = 'Emily Davis', contact = 'emily.davis@company.com'
WHERE job_id = 4;

UPDATE job_applied
SET recruiter_name = 'David Wilson', contact = 'david.wilson@company.com'
WHERE job_id = 5;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

SELECT * FROM job_applied;*/

WITH company_size AS (
    SELECT
    cd.name,
    COUNT(jpf.job_id) AS No_of_jobs
FROM
    job_postings_fact AS jpf
    JOIN company_dim AS cd
        ON cd.company_id = jpf.company_id

GROUP BY
    cd.name
)

SELECT
    cd.name,
    cs.No_of_jobs,
    CASE
        WHEN cs.No_of_jobs < 10 THEN 'small_company'
        WHEN cs.No_of_jobs <= 50 AND cs.No_of_jobs > 10 THEN 'medium_company'
        ELSE 'big_company'
    END AS company_dimension
FROM company_size AS cs
JOIN company_dim AS cd
    ON cd.name = cs.name
ORDER BY no_of_jobs DESC;