-- Step 1: Create the database
CREATE DATABASE CareerHub;
USE CareerHub;

-- Step 2: Create Tables
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY IDENTITY(1,1),
    CompanyName VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

CREATE TABLE Jobs (
    JobID INT PRIMARY KEY IDENTITY(100,1),
    CompanyID INT,
    JobTitle VARCHAR(255) NOT NULL,
    JobDescription TEXT,
    JobLocation VARCHAR(255),
    Salary DECIMAL(10,2),
    JobType VARCHAR(50),
    PostedDate DATETIME,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID) ON DELETE CASCADE
);

CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY IDENTITY(200,1),
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(20) UNIQUE NOT NULL,
    Resume VARCHAR(500),
    Location VARCHAR(255) -- Store applicant location
);

CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY IDENTITY(300,1),
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME,
    CoverLetter TEXT,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID) ON DELETE CASCADE,
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID) ON DELETE CASCADE
);

-- Step 3: Insert Data
-- Insert Companies
INSERT INTO Companies (CompanyName, Location) VALUES
('TCS', 'Mumbai, Maharashtra'),
('Infosys', 'Bengaluru, Karnataka'),
('Wipro', 'Hyderabad, Telangana'),
('HCL Technologies', 'Noida, Uttar Pradesh'),
('Tech Mahindra', 'Pune, Maharashtra'),
('Cognizant', 'Chennai, Tamil Nadu'),
('Capgemini', 'Bengaluru, Karnataka'),
('L&T Infotech', 'Mumbai, Maharashtra'),
('Mindtree', 'Pune, Maharashtra'),
('Hexaware', 'Chennai, Tamil Nadu');


INSERT INTO Jobs (CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate) VALUES
(1, 'Software Developer', 'Develop scalable software solutions.', 'Mumbai, Maharashtra', 800000.00, 'Full-time', '2025-03-01'),
(2, 'Data Analyst', 'Analyze data for business insights.', 'Bengaluru, Karnataka', 750000.00, 'Full-time', '2025-02-20'),
(3, 'Cloud Engineer', 'Design cloud-based infrastructures.', 'Hyderabad, Telangana', 900000.00, 'Full-time', '2025-01-15'),
(4, 'AI Engineer', 'Develop AI and ML models.', 'Noida, Uttar Pradesh', 1000000.00, 'Full-time', '2025-02-10'),
(5, 'Android Developer', 'Develop Android applications.', 'Pune, Maharashtra', 850000.00, 'Full-time', '2025-02-25'),
(6, 'Network Security Engineer', 'Ensure cybersecurity measures.', 'Chennai, Tamil Nadu', 780000.00, 'Full-time', '2025-03-05'),
(7, 'Project Manager', 'Lead IT projects.', 'Bengaluru, Karnataka', 1200000.00, 'Full-time', '2025-03-10'),
(8, 'Database Administrator', 'Manage and optimize databases.', 'Mumbai, Maharashtra', 820000.00, 'Full-time', '2025-02-28'),
(9, 'UX/UI Designer', 'Design user-friendly interfaces.', 'Pune, Maharashtra', 720000.00, 'Full-time', '2025-03-15'),
(10, 'Technical Support Engineer', 'Provide IT support.', 'Chennai, Tamil Nadu', 680000.00, 'Full-time', '2025-02-22');

INSERT INTO Applicants (FirstName, LastName, Email, Phone, Resume, Location) VALUES
('Ravi', 'Sharma', 'ravi.sharma@gmail.com', '9876543210', 'Experience: 3 years in Software Development | https://drive.google.com/ravisharma_cv.pdf', 'Mumbai, Maharashtra'),
('Priya', 'Verma', 'priya.verma@yahoo.com', '8765432109', 'Experience: 2 years in Data Analysis | https://drive.google.com/priyaverma_cv.pdf', 'Bengaluru, Karnataka'),
('Amit', 'Patel', 'amit.patel@outlook.com', '7654321098', 'Experience: 4 years in Cloud Computing | https://drive.google.com/amitpatel_cv.pdf', 'Hyderabad, Telangana'),
('Sanya', 'Kapoor', 'sanya.kapoor@gmail.com', '6543210987', 'Experience: 5 years in AI & ML | https://drive.google.com/sanyakapoor_cv.pdf', 'Noida, Uttar Pradesh'),
('Vikram', 'Singh', 'vikram.singh@yahoo.com', '5432109876', 'Experience: 3 years in Android Development | https://drive.google.com/vikramsingh_cv.pdf', 'Pune, Maharashtra'),
('Kiran', 'Nair', 'kiran.nair@outlook.com', '4321098765', 'Experience: 2 years in Cybersecurity | https://drive.google.com/kirannair_cv.pdf', 'Chennai, Tamil Nadu'),
('Ananya', 'Iyer', 'ananya.iyer@gmail.com', '3210987654', 'Experience: 4 years in Project Management | https://drive.google.com/ananyaiyer_cv.pdf', 'Bengaluru, Karnataka'),
('Rahul', 'Joshi', 'rahul.joshi@yahoo.com', '2109876543', 'Experience: 3 years in Database Administration | https://drive.google.com/rahuljoshi_cv.pdf', 'Mumbai, Maharashtra'),
('Sneha', 'Rao', 'sneha.rao@outlook.com', '1098765432', 'Experience: 2 years in UX/UI Design | https://drive.google.com/sneharao_cv.pdf', 'Pune, Maharashtra'),
('Arjun', 'Menon', 'arjun.menon@gmail.com', '9988776655', 'Experience: 5 years in IT Support | https://drive.google.com/arjunmenon_cv.pdf', 'Chennai, Tamil Nadu');

INSERT INTO Applications (JobID, ApplicantID, ApplicationDate, CoverLetter) VALUES
(100, 200, '2025-03-10', 'Applying for Software Developer role at TCS.'),
(101, 201, '2025-03-08', 'Interested in Data Analyst role at Infosys.'),
(102, 202, '2025-03-06', 'Looking forward to Cloud Engineer role at Wipro.'),
(103, 203, '2025-03-05', 'Passionate about AI Engineering at HCL Technologies.'),
(104, 204, '2025-03-03', 'Android Developer opportunity at Tech Mahindra excites me.'),
(105, 205, '2025-03-02', 'Experienced in cybersecurity, applying to Cognizant.'),
(106, 206, '2025-03-01', 'Seeking Project Manager role at Capgemini.'),
(107, 207, '2025-02-28', 'Applying for Database Administrator role at L&T Infotech.'),
(108, 208, '2025-02-27', 'Excited about UX/UI Designer role at Mindtree.'),
(109, 209, '2025-02-26', 'Technical Support Engineer position at Hexaware interests me.');

-- Queries
-- 5. Count applications for each job (including jobs with no applications)
SELECT j.JobTitle, COUNT(a.ApplicationID) AS ApplicationCount
FROM Jobs j
LEFT JOIN Applications a ON j.JobID = a.JobID
GROUP BY j.JobTitle


-- 6. Retrieve job listings within a specified salary range
DECLARE @MinSalary DECIMAL(10,2) = 700000;
DECLARE @MaxSalary DECIMAL(10,2) = 900000;

SELECT j.JobTitle, c.CompanyName, j.JobLocation, j.Salary
FROM Jobs j
JOIN Companies c ON j.CompanyID = c.CompanyID
WHERE j.Salary BETWEEN @MinSalary AND @MaxSalary
ORDER BY j.Salary DESC;


select * from Jobs
-- 7. Retrieve job application history for a specific applicant
SELECT j.JobTitle, c.CompanyName, a.ApplicationDate
FROM Applications a
JOIN Jobs j ON a.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID
WHERE a.ApplicantID = 201


select * from Applications

-- 8. Calculate and display average salary (excluding zero salary jobs)
SELECT AVG(Salary) AS AverageSalary
FROM Jobs
WHERE Salary > 0;

-- 9. Identify the company that has posted the most job listings (handling ties)
WITH JobCounts AS (
    SELECT c.CompanyName, COUNT(j.JobID) AS JobCount
    FROM Jobs j
    JOIN Companies c ON j.CompanyID = c.CompanyID
    GROUP BY c.CompanyName
)
SELECT CompanyName, JobCount
FROM JobCounts
WHERE JobCount = (SELECT MAX(JobCount) FROM JobCounts);

-- 10. Find applicants who applied to companies in 'CityX' and have at least 3 years of experience
DECLARE @CityX VARCHAR(255) = 'Chennai, Tamil Nadu';

SELECT a.FirstName, a.LastName, c.CompanyName, c.Location, a.Resume
FROM Applications app
JOIN Jobs j ON app.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID
JOIN Applicants a ON app.ApplicantID = a.ApplicantID
WHERE c.Location = @CityX 
AND (a.Resume LIKE '%3 years%' OR a.Resume LIKE '%4 years%' OR a.Resume LIKE '%5 years%')
ORDER BY a.FirstName, a.LastName;


-- 11. Retrieve distinct job titles with salaries between 600000 and 800000
SELECT DISTINCT JobTitle
FROM Jobs
WHERE Salary BETWEEN 600000 AND 800000;

-- 12. Find jobs that have not received any applications
SELECT JobTitle
FROM Jobs
WHERE JobID NOT IN (SELECT DISTINCT JobID FROM Applications);

-- 13. Retrieve a list of job applicants along with the companies and positions they applied for
SELECT a.FirstName, a.LastName, c.CompanyName, j.JobTitle
FROM Applications app
JOIN Jobs j ON app.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID
JOIN Applicants a ON app.ApplicantID = a.ApplicantID
ORDER BY a.FirstName, a.LastName;

-- 14. Retrieve a list of companies along with the count of jobs they have posted
SELECT c.CompanyName, COUNT(j.JobID) AS JobCount
FROM Companies c
LEFT JOIN Jobs j ON c.CompanyID = j.CompanyID
GROUP BY c.CompanyName
ORDER BY JobCount DESC;

-- 15. List all applicants along with the companies and positions they have applied for, including those who have not applied
SELECT a.FirstName, a.LastName, COALESCE(c.CompanyName, 'No Application') AS CompanyName, COALESCE(j.JobTitle, 'No Position') AS JobTitle
FROM Applicants a
LEFT JOIN Applications app ON a.ApplicantID = app.ApplicantID
LEFT JOIN Jobs j ON app.JobID = j.JobID
LEFT JOIN Companies c ON j.CompanyID = c.CompanyID
ORDER BY a.FirstName, a.LastName;

-- 16. Find companies that have posted jobs with a salary higher than the average salary of all jobs
SELECT DISTINCT c.CompanyName
FROM Companies c
JOIN Jobs j ON c.CompanyID = j.CompanyID
WHERE j.Salary > (SELECT AVG(Salary) FROM Jobs WHERE Salary > 0);

-- 17. Display a list of applicants with names and concatenated city and state
SELECT 
    FirstName, LastName,
    CONCAT(City, ', ', State) AS CityState
FROM 
    Applicants;


select * from Applicants

-- 18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'
SELECT JobTitle
FROM Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%'
ORDER BY JobTitle;

-- 19. Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants
SELECT COALESCE(a.FirstName, 'No Applicant') AS FirstName, COALESCE(a.LastName, '') AS LastName, COALESCE(j.JobTitle, 'No Application') AS JobTitle
FROM Applicants a
FULL OUTER JOIN Applications app ON a.ApplicantID = app.ApplicantID
FULL OUTER JOIN Jobs j ON app.JobID = j.JobID
ORDER BY a.FirstName, a.LastName;

-- 20. List all combinations of applicants and companies where the company is in a specific city and the applicant has more than 2 years of experience
DECLARE @City VARCHAR(255) = 'Chennai, Tamil Nadu';
SELECT a.FirstName, a.LastName, c.CompanyName, c.Location, a.Resume
FROM Applicants a
CROSS JOIN Companies c
WHERE c.Location = @City
AND (a.Resume LIKE '%3 years%' OR a.Resume LIKE '%4 years%' OR a.Resume LIKE '%5 years%')
ORDER BY a.FirstName, a.LastName;



