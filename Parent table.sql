Create  table Department
(
ROLL_ID number(10) primary key,
D_NAME varchar2(20) not null,
D_ID number(10) unique not null
);
commit;

select * from Department;

insert into Department
values (1, 'ragu', 1001);

insert into department
values (2, 'Sidharth', 20);

Update Department
set D_ID = 10
where ROLL_ID = 1;

INSERT INTO DEPARTMENT
VALUES (3, 'SIVA', 30);

INSERT INTO DEPARTMENT 
VALUES (4, 'ARIVU', 40);

UPDATE DEPARTMENT
SET D_NAME = 'SALES'
WHERE ROLL_ID = 2;

UPDATE DEPARTMENT
SET D_NAME = 'IT' 
WHERE ROLL_ID = 2;

UPDATE DEPARTMENT
SET D_NAME = 'IT' 
WHERE ROLL_ID = 2;


UPDATE DEPARTMENT
SET D_NAME = 'HR'  
WHERE ROLL_ID = 4;

SELECT * FROM DEPARTMENT;
COMMIT;
