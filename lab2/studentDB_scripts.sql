/*==============================================================*/
/* HATICE Z. YILMAZ                                             */ 
/*==============================================================*/

/*==============================================================*/
/* DROP THE CONSTRAINTS AND THE TABLES FOR STUDENTDB            */
/*==============================================================*/

alter table STUCOURSE
drop constraint STUCOURSE_REF_STUDENT_fk;

alter table STUCOURSE
drop constraint STUCOURSE_REF_COURSE_FK;

alter table SEMESTER
drop constraint SEMESTER_REF_STUDENT_FK;

drop table STUDENT cascade constraints;
drop table COURSE cascade constraints;
drop table STUCOURSE cascade constraints;
drop table SEMESTER cascade constraints;

/*==============================================================*/
/* Table: STUDENT                                               */
/*==============================================================*/

CREATE TABLE STUDENT
(STUID CHAR(4),
STNAME VARCHAR2(15) NOT NULL,
STSURNAME VARCHAR2(15) NOT NULL,
CGPA NUMBER(4,2),
REG_DATE DATE DEFAULT SYSDATE,
GRAD_DATE DATE,
CONSTRAINT STUDENT_PK PRIMARY KEY(STUID),
CONSTRAINT STUDENT_CHK CHECK(GRAD_DATE > REG_DATE));


/*==============================================================*/
/* Table: COURSE                                                */
/*==============================================================*/

CREATE TABLE COURSE
(CCODE CHAR(7),
CNAME VARCHAR2(50) NOT NULL,
CREDIT NUMBER(1),
CONSTRAINT COURSE_PK PRIMARY KEY(CCODE),
CONSTRAINT COURSE_CK CHECK (CREDIT >=0 AND CREDIT <=6));


/*==============================================================*/
/* Table: STUCOURSE                                             */
/*==============================================================*/

CREATE TABLE STUCOURSE
(STU_ID CHAR(4),
C_CODE CHAR(7),
SEM CHAR(3),
GRADE VARCHAR2(2),
CONSTRAINT STUCOURSE_PK PRIMARY KEY(STU_ID,C_CODE,SEM),
constraint STUCOURSE_REF_STUDENT_FK FOREIGN KEY (STU_ID) REFERENCES STUDENT(STUID),
constraint STUCOURSE_REF_COURSE_FK FOREIGN KEY (C_CODE) REFERENCES COURSE(CCODE));

/*==============================================================*/
/* Table: SEMESTER                                              */
/*==============================================================*/

CREATE TABLE SEMESTER
(SID CHAR(4),
SEM CHAR(3),
GPA NUMBER(4,2),
STANDING VARCHAR2(15),
CONSTRAINT SEMESTER_PK PRIMARY KEY(SID,SEM),
constraint SEMESTER_REF_STUDENT_FK FOREIGN KEY (SID) REFERENCES STUDENT(STUID) ON DELETE CASCADE);


--INSERTING into STUDENT
Insert into STUDENT (STUID, STNAME, STSURNAME, CGPA, REG_DATE)
VALUES ('1111','MUGE','GONEN',2.00, TO_DATE('01/09/16', 'DD/MM/YY'));

Insert into STUDENT (STUID, STNAME, STSURNAME, CGPA, REG_DATE) 
VALUES ('2222','KEREM','BAYCAN',1.00, TO_DATE('01/09/15', 'DD/MM/YY'));

Insert into STUDENT (STUID, STNAME, STSURNAME, CGPA, REG_DATE, GRAD_DATE) 
VALUES ('3333','ALI','COSAR',3, TO_DATE('01/09/14', 'DD/MM/YY'), TO_DATE('01/06/18', 'DD/MM/YY'));

Insert into STUDENT (STUID, STNAME, STSURNAME, CGPA, REG_DATE) 
values ('4444','SERTAC','KOZAN', 3.00, TO_DATE('01/09/16', 'DD/MM/YY'));

Insert into STUDENT (STUID, STNAME, STSURNAME, CGPA, REG_DATE) 
values ('5555','DAMLA','ASKIN',3.00, TO_DATE('01/09/15', 'DD/MM/YY'));
COMMIT;

--INSERTING into COURSE
Insert into COURSE values ('CTIS151','Intorduction to Programming',5);
Insert into COURSE values ('CTIS163','Discrete Mathematics',4);
Insert into COURSE values ('CTIS152','Algorithms and Data Structures',5);
Insert into COURSE values ('CTIS221','Object Oriented Programming',5);
Insert into COURSE values ('CTIS259','Database Management Systems and Applications',5);
COMMIT;

--INSERTING into SEMESTER
Insert into SEMESTER values ('1111','161',3.39,'HONOUR');
Insert into SEMESTER values ('1111','162',3.30,'HONOUR');
Insert into SEMESTER values ('2222','161',2.80,'SATIS');
Insert into SEMESTER values ('4444','161',4.00,'HIGH HONOUR');
COMMIT;

--INSERTING into STUCOURSE
Insert into STUCOURSE values ('1111','CTIS151','161','A-');
Insert into STUCOURSE values ('1111','CTIS163','161','B');
Insert into STUCOURSE values ('1111','CTIS152','162','B+');
Insert into STUCOURSE values ('2222','CTIS221','161','C+');
Insert into STUCOURSE values ('2222','CTIS259','161','B+');
Insert into STUCOURSE values ('4444','CTIS163','161','A');
Insert into STUCOURSE values ('4444','CTIS221','161','A');
Insert into STUCOURSE values ('4444','CTIS259','161','A');
COMMIT;
