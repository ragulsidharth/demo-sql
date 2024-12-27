--Count the Number of Records in Each Table

SELECT COUNT(*) AS Total_Colleges FROM College;

SELECT COUNT(*) AS Total_Students FROM Student;

--Verify Data for Specific College

SELECT * FROM College WHERE College_name LIKE '%P%';

SELECT * FROM College WHERE City = 'CHENNAI';

--Students Enrolled in a Specific College

SELECT * FROM Student 
WHERE College_id = 101;

--List Students with Invalid Gender Data

SELECT * FROM Student 
WHERE Gender NOT IN ('Male', 'Female');

--Students by Enrollment Year

SELECT TO_CHAR(Enrollment_date, 'YYYY') AS Enrollment_Year, COUNT(*) AS Student_Count
FROM Student
GROUP BY TO_CHAR(Enrollment_date, 'YYYY')
ORDER BY Enrollment_Year;

--Students by Gender

SELECT Gender, COUNT(*) AS Gender_Count
FROM Student
GROUP BY Gender;

--Colleges in Each State

SELECT State, COUNT(*) AS College_Count
FROM College
GROUP BY State
ORDER BY College_Count DESC;

--Check for Null Institution_Type in Colleges

SELECT * FROM College 
WHERE Institution_Type IS NULL;

--Students without Assigned Colleges

SELECT * FROM Student 
WHERE College_id IS NULL;

--Verify Students with a Specific Email Domain

SELECT * FROM Student 
WHERE Email LIKE '%gmail.com';

--Verify Students with Incorrect Phone Number Length

SELECT * FROM Student 
WHERE LENGTH(Phone_number) != 10;

--Colleges with the Most Students Enrolled

SELECT C.College_name, COUNT(S.Student_id) AS Total_Students
FROM College C
LEFT JOIN Student S ON C.College_id = S.College_id
GROUP BY C.College_name
ORDER BY Total_Students DESC;

--List Students Along with Their College Names

SELECT S.Student_id, S.Student_name, S.City AS Student_City, C.College_name, C.City AS College_City
FROM Student S
LEFT JOIN College C ON S.College_id = C.College_id;

--Verify Constraints

SELECT constraint_name, constraint_type FROM user_constraints
WHERE table_name = 'COLLEGE';

SELECT constraint_name, constraint_type FROM user_constraints
WHERE table_name = 'STUDENT';

--Find Colleges Located in a Specific City

SELECT * FROM College
WHERE City = 'Karur';

--Find Students from a Specific College

SELECT Student_id, Student_name, Gender, Email, Phone_number
FROM Student
WHERE College_id = 102;

--Count Students by College and Gender

SELECT C.College_name, S.Gender, COUNT(*) AS Gender_Count
FROM Student S
JOIN College C ON S.College_id = C.College_id
GROUP BY C.College_name, S.Gender;

--Students Who Enrolled After a Specific Date

SELECT * FROM Student
WHERE Enrollment_date > TO_DATE('2023-01-01', 'YYYY-MM-DD');

--List of Colleges With Their State and City

SELECT College_name, State, City FROM College
ORDER BY State, City;

--Check for Duplicate Student Records

SELECT Student_id, COUNT(*) FROM Student
GROUP BY Student_id
HAVING COUNT(*) > 1;

--List Colleges with More Than a Specific Number of Students

SELECT College_name, COUNT(*) AS Total_Students FROM Student
JOIN College C ON Student.College_id = C.College_id
GROUP BY College_name
HAVING COUNT(*) > 2; 

--Verify Students by State of College

SELECT C.State, COUNT(*) AS Student_Count
FROM Student S
JOIN College C ON S.College_id = C.College_id
GROUP BY C.State
ORDER BY Student_Count DESC;

--Check for Invalid Enrollment Dates (Past or Future Dates)

SELECT * FROM Student
WHERE Enrollment_date < TO_DATE('2023-01-01', 'YYYY-MM-DD')
OR Enrollment_date > SYSDATE;

--Find Students with a Specific Email Domain

SELECT * FROM Student
WHERE Email LIKE '%yahoo.com';

--List Colleges by Number of Students (Descending Order)

SELECT C.College_name, COUNT(S.Student_id) AS Total_Students
FROM College C
LEFT JOIN Student S ON C.College_id = S.College_id
GROUP BY C.College_name
ORDER BY Total_Students DESC;

--Verify Students with Missing or Invalid Names

SELECT * FROM Student
WHERE Student_name IS NULL
OR LENGTH(Student_name) < 4; 

--Find Students in a Specific Range of Enrollment Dates

SELECT * FROM Student
WHERE Enrollment_date BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD')
AND TO_DATE('2023-12-31', 'YYYY-MM-DD');

--List Colleges by Institution Type

SELECT Institution_Type, COUNT(*) AS College_Count
FROM College
GROUP BY Institution_Type
ORDER BY College_Count DESC;

