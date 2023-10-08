/*==============================================================*/
/* HATICE Z. YILMAZ                                             */
/*==============================================================*/
/*==============================================================*/
/* DROP THE CONSTRAINTS AND THE TABLES FOR companyDB           */
/*==============================================================*/
alter table EMPLOYEE 
drop constraint EMPLOYEE_FK2;

alter table EMPLOYEE 
drop constraint EMPLOYEE_FK1;

alter table DEPARTMENT 
drop constraint DEPARTMENT_FK1;

alter table DEPT_LOCATION 
drop constraint DEPT_LOCATION_FK1;

alter table PROJECT 
drop constraint PROJECT_FK1;

alter table WORKS_ON 
drop constraint WORKS_ON_FK1;

alter table WORKS_ON 
drop constraint WORKS_ON_FK2;

alter table DEPENDENT 
drop constraint DEPENDENT_FK1;

drop table EMPLOYEE cascade constraints;
drop table DEPARTMENT cascade constraints;
drop table DEPT_LOCATION cascade constraints;
drop table DEPENDENT cascade constraints;
drop table PROJECT cascade constraints;
drop table WORKS_ON cascade constraints;

/*==============================================================*/
/* Table: DEPARTMENT                                            */
/*==============================================================*/
CREATE TABLE DEPARTMENT(
DNAME VARCHAR2(15),
DNUMBER NUMBER(3), 
MGRSSN NUMBER(3), 
MGRSTARTDATE CHAR(8), 
CONSTRAINT DEPARTMENT_PK PRIMARY KEY (DNUMBER));

/*==============================================================*/
/* Table: EMPLOYEE                                              */
/*==============================================================*/
CREATE TABLE EMPLOYEE
(FNAME VARCHAR2(15), 
LNAME VARCHAR2(15), 
SSN NUMBER(3),
BDATE CHAR(8), 
ADDRESS VARCHAR2(20),
SALARY NUMBER(10),
SEX CHAR(1), 
SUPERSSN NUMBER(3), 
DNO NUMBER(3),
CONSTRAINT EMPLOYEE_PK PRIMARY KEY(SSN),
CONSTRAINT EMPLOYEE_FK1 FOREIGN KEY(DNO)REFERENCES DEPARTMENT (DNUMBER) DEFERRABLE INITIALLY DEFERRED
);  

/*==============================================================*/
/* Table: DEPT_LOCATION                                         */
/*==============================================================*/
CREATE TABLE DEPT_LOCATION(
DNUMBER NUMBER(3),
DLOCATION VARCHAR2(15),
CONSTRAINT DEPT_LOCATION_PK PRIMARY KEY (DNUMBER, DLOCATION));

/*==============================================================*/
/* Table: DDEPENDENT                                            */
/*==============================================================*/
CREATE TABLE DEPENDENT(	
ESSN NUMBER(3), 
DEPENDENT_NAME VARCHAR2(15), 
SEX CHAR(1), 
BDATE CHAR(8), 
RELATIONSHIP VARCHAR2(15), 
CONSTRAINT DEPENDENT_PK PRIMARY KEY (ESSN, DEPENDENT_NAME));

/*==============================================================*/
/* Table: WORKS_ON                                              */
/*==============================================================*/
CREATE TABLE WORKS_ON(
ESSN NUMBER(3), 
PNO NUMBER(3),
HOURS NUMBER(2),
CONSTRAINT WORKS_ON_PK PRIMARY KEY (ESSN, PNO)
);

-- Get a list of all tables 
Select *  from tab;

/*==============================================================*/
/* DATA ENTRY: DEPARTMENT                                       */
/*==============================================================*/
insert into department values('RESEARCH',1,111,'12.05.98');
insert into department values('ADMINISTRATION',2,222,'15.08.94');
insert into department values('TOURISM',3,333,'18.05.99');
insert into department values('PERSONNEL',4,123,'20.04.10');
insert into department values('PAYROLL',5,124,'18.10.15');

/*==============================================================*/
/* DATA ENTRY: EMPLOYEE                                         */
/*==============================================================*/
insert into employee values ('JOHN','MICC',111,'12.10.72','HOUSTON',10000,'M',222,1);
insert into employee values ('MARRY','MINELL',222,'23.09.54','HOUSTON',12000,'F',111,2);
insert into employee values ('ALICE','SMITH',333,'14.03.67','NEWYORK',15000,'F',222,1);
insert into employee values ('JAMES','WONG',444,'12.02.55','NEWYORK',12000,'M',222,3);
insert into employee values ('FRANKLIN','WALLACE',555,'19.09.72','HOUSTON',12000,'M',111,3);

insert into employee values ('ANN','YOUNG',123,'20.03.89','COLORADO',13000,'F',111,1);
insert into employee values ('JANE','FRANK',124,'03.05.90','CALIFORNIA',14000,'F',222,2);
insert into employee values ('JACK','MITO',334,'24.11.94','STAFFORD',12000,'M',111,1);
insert into employee values ('ARDEN','ABRAM',113,'15.12.87','MARYLAND',10000,'M',111,4);
insert into employee values ('BILL','CURTIS',114,'31.07.82','COLORADO',18000,'M',111,4);
insert into employee values ('ARIA','BLAKE',115,'13.01.62','HOUSTON',20000,'F',222,1);


--COMMIT the changes using the following SQL command;
COMMIT;

--DEFINE THE FOLLOWING FOREIGN KEYS IN THE SCENARIO ABOVE.
--	ADD FOREIGN KEY: EMPLOYEE.SUPERSSN,
ALTER TABLE EMPLOYEE
ADD CONSTRAINT EMPLOYEE_FK2 FOREIGN KEY(SUPERSSN) REFERENCES EMPLOYEE (SSN);

--	ADD FOREIGN KEY: DEPARTMENT.MGRSSN
ALTER TABLE DEPARTMENT 
ADD CONSTRAINT DEPARTMENT_FK1 FOREIGN KEY(MGRSSN) REFERENCES EMPLOYEE (SSN);

--Change the property of the constraint EMPLOYEE_FK1 to IMMEDIATE;
SET CONSTRAINTS EMPLOYEE_FK1 IMMEDIATE;

--Examine the CompanyDB diagram on the first page and add the other foreign keys:
-- DEPT_LOCATION.DNUMBER
ALTER TABLE DEPT_LOCATION
ADD CONSTRAINT DEPT_LOCATION_FK1 FOREIGN KEY(DNUMBER) REFERENCES DEPARTMENT(DNUMBER);

--	ADD FOREIGN KEY: DEPENDENT.ESSN
ALTER TABLE DEPENDENT
ADD CONSTRAINT DEPENDENT_FK1 FOREIGN KEY(ESSN) REFERENCES EMPLOYEE (SSN);

--	ADD FOREIGN KEY: WORKS_ON.ESSN
ALTER TABLE WORKS_ON
ADD CONSTRAINT WORKS_ON_FK1 FOREIGN KEY(ESSN) REFERENCES EMPLOYEE (SSN);

--	ADD FOREIGN KEY: WORKS_ON.PNO (*)
ALTER TABLE WORKS_ON
ADD CONSTRAINT WORKS_ON_FK2 FOREIGN KEY(PNO) REFERENCES PROJECT(PNUMBER);

--	ADD FOREIGN KEY: PROJECT.DNUM (*)
ALTER TABLE PROJECT
ADD CONSTRAINT PROJECT_FK1 FOREIGN KEY(DNUM) REFERENCES DEPARTMENT(DNUMBER);

-- (*) While creating the foreign keys WORKS_ON.PNO and PROJECT.DNUM you will have a problem. 
-- Because the table PROJECT was NOT created. Now create the table as follows and then try to create 
-- the foreign keys WORKS_ON.PNO and PROJECT.DNUM again:

/*==============================================================*/
/* Table: PROJECT                                               */
/*==============================================================*/
CREATE TABLE PROJECT(
PNAME VARCHAR2(15), 
PNUMBER NUMBER(3), 
PLOCATION VARCHAR2(15), 
DNUM NUMBER(3), 
CONSTRAINT PROJECT_PK PRIMARY KEY (PNUMBER));

--	ADD FOREIGN KEY: WORKS_ON.PNO
ALTER TABLE WORKS_ON
ADD CONSTRAINT WORKS_ON_FK2 FOREIGN KEY(PNO) REFERENCES PROJECT(PNUMBER);

--	ADD FOREIGN KEY: PROJECT.DNUM
ALTER TABLE PROJECT
ADD CONSTRAINT PROJECT_FK1 FOREIGN KEY(DNUM) REFERENCES DEPARTMENT(DNUMBER);

--Insert data into all tables. While inserting data take care of the referential integrity rules
/*==============================================================*/
/* DATA ENTRY: DEPT_LOCATION                                    */
/*==============================================================*/
insert into DEPT_LOCATION values (1,'HOUSTON');
insert into DEPT_LOCATION values (2,'STAFFORD');
insert into DEPT_LOCATION values (3,'HOUSTON');
insert into DEPT_LOCATION values (1,'NEWYORK');
insert into DEPT_LOCATION values (4,'NEWYORK');
insert into DEPT_LOCATION values (4,'STAFFORD');
insert into DEPT_LOCATION values (5,'COLORADO');
insert into DEPT_LOCATION values (5,'CALIFORNIA');

/*==============================================================*/
/* DATA ENTRY: DEPENDENT                                        */
/*==============================================================*/
insert into dependent values(111,'JOY','M','12.10.73','SON');
insert into dependent values(111,'ALICE','F','18.09.75','DAUGHTER');
insert into dependent values(222,'MARY','F','15.04.76','SISTER');
insert into dependent values(333,'MICHAEL','M','23.04.67','SON');
insert into dependent values(123,'MARY','F','23.04.80','DAUGHTER');
insert into dependent values(123,'MICHAEL','M','12.05.79','SON');
insert into dependent values(114,'BARBARA','F','30.05.88','WIFE');

/*==============================================================*/
/* DATA ENTRY: PROJECT                                          */
/*==============================================================*/
insert into project values('PRODUCT_X',1,'HOUSTON',1);
insert into project values('PRODUCT_Y',2,'NEWYORK',1);
insert into project values('PRODUCT_Z',3,'STAFFORD',2);
insert into project values('PRODUCT_M',4,'STAFFORD',2);
insert into project values('PRODUCT_L',5,'HOUSTON',3);

/*==============================================================*/
/* DATA ENTRY: WORKS_ON                                         */
/*==============================================================*/
insert into works_on values(111,1,12);
insert into works_on values(111,2,6);
insert into works_on values(222,1,20);
insert into works_on values(113,2,8);
insert into works_on values(114,2,8);
insert into works_on values(123,2,8);
insert into works_on values(114,1,28);
insert into works_on values(114,3,40);
insert into works_on values(333,2,8);
insert into works_on values(124,4,25);
insert into works_on values(115,4,8);

COMMIT;
