(--PARENT TABLE)

CREATE TABLE College 
(
    College_id NUMBER PRIMARY KEY,
    College_name VARCHAR2(100) NOT NULL,
    College_type VARCHAR2(10) CHECK (college_type IN ('Public', 'Private')),
    Address VARCHAR2(200) NOT NULL,
    City VARCHAR2(50) NOT NULL,
    State VARCHAR2(50) NOT NULL,
    Phone_number VARCHAR2(15),
    Email VARCHAR2(100)
);

SELECT * FROM COLLEGE;

ALTER TABLE COLLEGE
DROP COLUMN ADDRESS;

ALTER TABLE COLLEGE
DROP COLUMN College_type ;


ALTER TABLE COLLEGE
ADD CONSTRAINT CHK_INSTITUTION_TYPE
CHECK (INSTITUTION_TYPE IN ('Public', 'Private', 'PUBLIC', 'PRIVATE'));

ALTER TABLE College
ADD CONSTRAINT chk_college_type
CHECK (college_type IN ('Public', 'Private', 'PUBLIC', 'PRIVATE'));


INSERT INTO College VALUES (101, 'PSG COLLEGE', 'Private', 'COIMBATORE','TAMILNADU', '+918976549876', 'info@ox.ac.uk');
INSERT INTO College VALUES (2, 'Stanford University', 1885, 'Private', 'NA', '450 Serra Mall', 'Stanford', 'California', '94305', '+16507234000', 'admissions@stanford.edu', 'www.stanford.edu');

SELECT constraint_name
FROM user_constraints
WHERE table_name = 'COLLEGE' AND column_name = 'INSTITUTION_TYPE';

SELECT constraint_name
FROM user_constraints
WHERE table_name = 'COLLEGE' AND column_name = 'INSTITUTION_TYPE';

ALTER TABLE COLLEGE DROP CONSTRAINT <existing_constraint_name>;


DESC COLLEGE;

ALTER TABLE COLLEGE
ADD CONSTRAINT CHK_INSTITUTION_TYPE
CHECK ("institution_type" IN ('Public', 'Private', 'PUBLIC', 'PRIVATE'));


SELECT column_name
FROM user_tab_columns
WHERE table_name = 'COLLEGE';

ALTER TABLE COLLEGE
ADD INSTITUTION_TYPE VARCHAR2(10);

ALTER TABLE COLLEGE
ADD CONSTRAINT CHK_INSTITUTION_TYPE
CHECK (INSTITUTION_TYPE IN ('Public', 'Private', 'PUBLIC', 'PRIVATE'));


SELECT * FROM COLLEGE;

UPDATE COLLEGE
SET INSTITUTION_TYPE = 'PRIVATE'
WHERE COLLEGE_ID = 101;

INSERT INTO COLLEGE VALUES (102, 'GRD COLLEGE', 'COIMBATORE', 'TAMILNADU', '+918906786789', 'grd5@ac.in', 'Private' );

INSERT INTO COLLEGE VALUES (103, 'SRM COLLEGE', 'CHENNAI', 'TAMILNADU', '+917890987678', 'srm7@ac.in', 'Private' );

INSERT INTO COLLEGE VALUES (104, 'Government Arts College', 'COIMBATORE', 'TAMILNADU', '+917890678989', 'gov3@ad.in', 'Public' );

INSERT INTO COLLEGE VALUES (105, 'Kongu Engineering College,', 'Erode', 'TAMILNADU', '+917890678978', 'kog8@ad.in', 'Private' );

update college
set college_name = 'Kongu Engineering College'
where college_id = 104;

delete from college
where college_id = 105;

select * from college;

commit;

INSERT INTO COLLEGE VALUES (106, 'Paavai College,', 'Namakkal', 'TAMILNADU', '+918765787689', 'pvn3@ad.in', 'Private' );

INSERT INTO COLLEGE VALUES (107, 'Kamarasamy College,', 'Karur', 'TAMILNADU', '+918901236543', 'kmr56@ad.in', 'Private' );

INSERT INTO COLLEGE VALUES (108, 'Thanthonimalai College,', 'Karur', 'TAMILNADU', '+917890098765', 'tncg4@ad.in', 'Public' );

update college
set College_name = 'Thanthonimalai College'
where college_id = 108;

INSERT INTO COLLEGE VALUES (105, 'VSB College', 'Karur', 'TAMILNADU', '+919876789987', 'vsb6@ad.in', 'Private' );

select * from College;

INSERT INTO COLLEGE VALUES (109, 'Government Arts College', 'Salem', 'TAMILNADU', '+917890098798', 'govtslm@ad.in', 'Public' );

INSERT INTO COLLEGE VALUES (110, 'Government Arts College', 'Madurai', 'TAMILNADU', '+918903106308', 'govtmadurai@ad.in', 'Public' );

commit;

select * from college
order by 'college_id' desc;

SELECT * FROM college
ORDER BY college_id asc;

INSERT INTO COLLEGE VALUES (111, 'KARPAGAM COLLEGE', 'COIMBATORE', 'TAMILNADU', '+919876543210', 'kagm98@gmail.com', 'PRIVATE' );

INSERT INTO COLLEGE VALUES (112, 'GOVERNMENT MEDICAL COLLEGE', 'TIRUNELVELI', 'TAMILNADU', '+919384756271', 'govttirunelveli6@gmail.com', 'PUBLIC' );

INSERT INTO COLLEGE VALUES (113, 'LOYOLA COLLEGE', 'CHENNAI', 'TAMILNADU', '+919384756271', 'loyalachennai50@gmail.com', 'PRIVATE' );

SELECT * FROM college;

INSERT INTO COLLEGE VALUES (114, 'BANNARI AMMAN ', 'ERODE', 'TAMILNADU', '+918276352198', 'bannarierode750@gmail.com', 'PRIVATE' );

INSERT INTO COLLEGE VALUES (115, 'GOVERNMENT LAW COLLEGE', 'THENI', 'TAMILNADU', '+919076543218', 'govtlaw50@gmail.com', 'PUBLIC' );

INSERT INTO COLLEGE VALUES (116, 'THE AMERICAN COLLEGE', 'TRICHY', 'TAMILNADU', '+917896543218', 'amrtry5@gmail.com', 'PRIVATE' );
 
INSERT INTO COLLEGE VALUES (117, 'MAHATMA GANDHI COLLEGE', 'NAGERCOIL', 'TAMILNADU', '+919876543218', 'ghandhikk9@gmail.com', 'PRIVATE' );

INSERT INTO COLLEGE VALUES (118, 'SRI RAMACHANDRA MEDICAL COLLEGE', 'TRICHY', 'TAMILNADU', '+919076544321', 'ramamedi45@gmail.com', 'PUBLIC' );

INSERT INTO COLLEGE VALUES (119, 'PSG COLLEGE', 'MADURAI', 'TAMILNADU', '+919076576518', 'psgmadurai56@gmail.com', 'PUBLIC' );

UPDATE COLLEGE
SET INSTITUTION_TYPE = 'PRIVATE'
WHERE COLLEGE_ID = 118;


SELECT * FROM COLLEGE;
INSERT INTO COLLEGE VALUES (120, 'RAGHU COLLEGE', 'VISAKHAPATNAM', 'ANDHRA PRADESH', '+919177012345', 'raghu98@gmail.com', 'PRIVATE' );

commit;

(--CHILD TABLE)

CREATE TABLE Student (
    Student_id NUMBER(10) PRIMARY KEY,
    Student_name VARCHAR2(100) NOT NULL,
    Age NUMBER(3),
    Gender CHAR(6) CHECK (Gender IN ('M', 'F', 'Female', 'Male')),
    City VARCHAR2(15),
    Email VARCHAR2(100) UNIQUE,
    Phone_number VARCHAR2(15) UNIQUE CHECK (LENGTH(Phone_number) = 10),
    Enrollment_date DATE DEFAULT SYSDATE,
    College_id NUMBER(10),
    FOREIGN KEY (College_id) REFERENCES College(College_id) ON DELETE SET NULL
);

select * from student;

insert into student values (1001, 'RAGU', 23, 'M', 'KARUR', 'ragul5@gmail.com', 7890987654, TO_DATE('2024-12-05', 'YYYY-MM-DD'), 101);

insert into student values (1002, 'VASU', 22, 'M', 'MADURAI', 'vasuy6@gmail.com', 7890987651, TO_DATE('2024-11-05', 'YYYY-DD-MM'), 102);

insert into student values (1003, 'ARASU', 22, 'M', 'MADURAI', 'arasudd78@gmail.com', 7890987652, TO_DATE('2024-01-06', 'YYYY-MM-DD'), 103);

insert into student values (1004, 'DEVA', 25, 'M', 'THENI', 'deva67@gmail.com', 7890987653, TO_DATE('2024-11-05', 'YYYY-DD-MM'), 104);

insert into student values (1005, 'HEMA', 23, 'Female', 'KARUR', 'hemaragu5@gmail.com', 7890987655, TO_DATE('2024-10-05', 'YYYY-DD-MM'), 105);

insert into student values (1006, 'RAGUL', 23, 'Male', 'KARUR', 'raguhema5@gmail.com', 7890987656, TO_DATE('2024-10-05', 'YYYY-DD-MM'), 105);

insert into student values (1007, 'SATHYA', 24, 'Female', 'CHENNAI', 'sathyaselvam45@gmail.com', 7890987657, TO_DATE('2023-10-05', 'YYYY-DD-MM'), 106);

insert into student values (1008, 'SIDHARTH', 22, 'Male', 'ERODE', 'sid678@gmail.com', 7890987658, TO_DATE('2023-10-05', 'YYYY-DD-MM'), 104);

insert into student values (1009, 'KARTHIKA', 23, 'Female', 'KARUR', 'karthidhaya21@gmail.com', 7890987659, TO_DATE('2022-10-05', 'YYYY-DD-MM'), 105);

insert into student values (1010, 'KEERTHANA', 23, 'Female', 'NAMAKKAL', 'keerthanafid78@gmail.com', 7890987660, TO_DATE('2024-12-01', 'YYYY-DD-MM'), 110);

insert into student values (1011, 'ALAN', 23, 'M', 'CHENNAI', 'alandefender78@gmail.com', 7890987600, TO_DATE('2024-06-05', 'YYYY-DD-MM'), 108);

insert into student values (1012, 'PHILL', 24, 'Male', 'CHENNAI', 'phillstu56@gmail.com', 7890987601, TO_DATE('2023-04-02', 'YYYY-DD-MM'), 109);

insert into student values (1013, 'GEETHA', 22, 'F', 'TANJORE', 'geethaarya2@gmail.com', 7890987602, TO_DATE('2024-05-19', 'YYYY-MM-DD'), 107);

insert into student values (1014, 'HEMA', 22, 'Female', 'SELAM', 'hemaselvaraj@gmail.com', 7890987603, TO_DATE('2024-06-30', 'YYYY-MM-DD'), 110);

insert into student values (1015, 'RAGUL', 21, 'M', 'VELLORE', 'ragulkk5@gmail.com', 7890987604, TO_DATE('2024-02-27', 'YYYY-MM-DD'), 111);

insert into student values (1016, 'RAGUPATHY', 25, 'Male', 'KARUR', 'ragu6040@gmail.com', 7890987605, TO_DATE('2024-06-30', 'YYYY-MM-DD'), 111);

insert into student values (1017, 'ABIRAMI', 22, 'Female', 'THIRCHY', 'abidevi67@gmail.com', 7890987606, TO_DATE('2023-05-06', 'YYYY-MM-DD'), 112);

insert into student values (1018, 'SELVI', 24, 'F', 'DHARMAPURI', 'selvinagaraj3@gmail.com', 7890987607, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 113);

insert into student values (1019, 'MATHI', 22, 'Female', 'KUMBAKONAM', 'mathimarantt2@gmail.com', 7890987608, TO_DATE('2024-02-09', 'YYYY-MM-DD'), 114);

insert into student values (1020, 'LATHIKA', 25, 'Female', 'NATHIYA', 'nathiyadevi65@gmail.com', 7890987609, TO_DATE('2023-05-20', 'YYYY-MM-DD'), 115);

UPDATE STUDENT
SET CITY = 'MADURAI'
WHERE STUDENT_ID = 1020;

SELECT * FROM STUDENT;

insert into student values (1021, 'HEMA', 24, 'Female', 'THIRUNELVELI', 'hemakumar44@gmail.com', 7890987610, TO_DATE('2022-01-31', 'YYYY-MM-DD'), 116);

insert into student values (1022, 'SRIVALLI', 23, 'Female', 'SELAM', 'srivallipushpa22@gmail.com', 7890987611, TO_DATE('2024-06-30', 'YYYY-MM-DD'), 110);

insert into student values (1023, 'VARUN', 22, 'Male', 'CHENGALPATTU', 'varuntej65@gmail.com', 7890987612, TO_DATE('2024-06-30', 'YYYY-MM-DD'), 111);

insert into student values (1024, 'ARIVU', 22, 'M', 'CUDDALORE', 'arivathambi21@gmail.com', 7890987613, TO_DATE('2024-07-30', 'YYYY-MM-DD'), 115);

insert into student values (1025, 'BOOMINATHAN', 23, 'Male', 'DINDIGUL', 'boomi2039@gmail.com', 7890987614, TO_DATE('2024-12-20', 'YYYY-MM-DD'), 116);

insert into student values (1026, 'NILA', 21, 'Female', 'CHENNAI', 'nilasurya45@gmail.com', 7890987615, TO_DATE('2024-03-23', 'YYYY-MM-DD'), 117);

insert into student values (1027, 'DIVYA', 24, 'Female', 'TIRUVANNAMALAI', 'divyabaskargt55@gmail.com', 7890987620, TO_DATE('2024-07-26', 'YYYY-MM-DD'), 118);

insert into student values (1028, 'VIJAY', 23, 'M', 'KRISHNAGIRI', 'vijayrajendran2026@gmail.com', 7890987621, TO_DATE('2023-02-21', 'YYYY-MM-DD'), 119);

insert into student values (1029, 'BALA GOVIND', 22, 'Male', 'PERAMBALUR', 'balagovind56@gmail.com', 7890987622, TO_DATE('2022-02-21', 'YYYY-MM-DD'), 120);

insert into student values (1030, 'BHARTH RAM', 24, 'M', 'TIRUPPUR', 'bharathcm65@gmail.com', 7890987623, TO_DATE('2022-03-16', 'YYYY-MM-DD'), 120);

insert into student values (1031, 'ARJUN', 25, 'Male', 'THENI', 'arjunsarkar95@gmail.com', 7890987624, TO_DATE('2022-03-19', 'YYYY-MM-DD'), 111);

insert into student values (1032, 'NELSON', 23, 'Male', 'KARUR', 'nelsondilipkumar4@gmail.com', 7890987625, TO_DATE('2024-06-30', 'YYYY-MM-DD'), 110);

insert into student values (1033, 'ARUMPON', 22, 'M', 'SIVAGANGAI', 'arumponthulasi56@gmail.com', 7890987626, TO_DATE('2023-02-27', 'YYYY-MM-DD'), 102);

insert into student values (1034, 'MALAR', 23, 'Female', 'NILGIRIS', 'saipallavi99@gmail.com', 7890987627, TO_DATE('2024-02-14', 'YYYY-MM-DD'), 114);

insert into student values (1035, 'TARA', 22, 'Female', 'CHENNAI', 'tarajaisrinath56@gmail.com', 7890987628, TO_DATE('2024-01-03', 'YYYY-MM-DD'), 115);

insert into student values (1036, 'KARTHIK', 22, 'Male', 'CHENNAI', 'karthiganesan55@gmail.com', 7890987629, TO_DATE('2024-07-22', 'YYYY-MM-DD'), 117);

insert into student values (1037, 'VIJAYA RAGHAVAN', 25, 'Male', 'TIRUNELVELI', 'vijayajay56@gmail.com', 7890987630, TO_DATE('2024-03-12', 'YYYY-MM-DD'), 118);

insert into student values (1038, 'VEERA RAGHAVAN', 23, 'Male', 'CHENNAI', 'veera45@gmail.com', 7890987631, TO_DATE('2024-03-27', 'YYYY-MM-DD'), 119);

insert into student values (1039, 'SAMEERA', 25, 'Female', 'TIRUPATHUR', 'sameerasathya67@gmail.com', 7890987632, TO_DATE('2024-07-22', 'YYYY-MM-DD'), 112);

insert into student values (1040, 'SIVAJI', 24, 'Male', 'NAMAKKAL', 'sivajitt56@gmail.com', 7890987633, TO_DATE('2024-02-19', 'YYYY-MM-DD'), 113);

insert into student values (1041, 'GURU', 22, 'Male', 'RAMANATHAPURAM', 'guru65@gmail.com', 7890987634, TO_DATE('2024-06-22', 'YYYY-MM-DD'), 107);

insert into student values (1042, 'SAKTHIVEL', 22, 'Male', 'CHENNAI', 'sakthivelragavan23@gmail.com', 7890987635, TO_DATE('2024-04-28', 'YYYY-MM-DD'), 115);

insert into student values (1043, 'JANANI', 22, 'Female', 'KRISHNAGIRI', 'jananiram90@gmail.com', 7890987636, TO_DATE('2024-07-10', 'YYYY-MM-DD'), 105);

insert into student values (1044, 'PREETHI', 24, 'Female', 'ARIYALUR', 'preethiveera34@gmail.com', 7890987637, TO_DATE('2023-06-21', 'YYYY-MM-DD'), 104);

insert into student values (1045, 'AMULYA', 23, 'Female', 'ERODE', 'amu6050@gmail.com', 7890987638, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 102);

insert into student values (1046, 'DANIEL', 22, 'Male', 'KALLAKURICHI', 'danielarockiyaraj5677@gmail.com', 7890987639, TO_DATE('2024-04-09', 'YYYY-MM-DD'), 101);

insert into student values (1047, 'DAYANAND', 25, 'Male', 'KANCHEEPURAM', 'dayanandsurya34@gmail.com', 7890987640, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 116);

insert into student values (1048, 'DHANUSHKODI', 24, 'Male', 'DHARMAPURI', 'dhanushkodi4321@gmail.com', 7890987641, TO_DATE('2023-02-07', 'YYYY-MM-DD'), 118);

insert into student values (1049, 'HEMA', 23, 'Female', 'THOOTHUKUDI', 'hemasidharth9876@gmail.com', 7890987642, TO_DATE('2024-01-24', 'YYYY-MM-DD'), 119);

insert into student values (1050, 'RAGUL', 24, 'Male', 'THANJAVUR', 'ragulsidharth6040@gmail.com', 7558114308, TO_DATE('2024-12-05', 'YYYY-MM-DD'), 120);

SELECT * FROM STUDENT;

COMMIT;

