/***************************************/
/* BANKINGDB TABLE CREATIONS           */
/***************************************/

drop table creditaccount cascade constraints;
drop table account cascade constraints;
drop table branch cascade constraints;
drop table customer cascade constraints;

create table customer
(
custno number(4),
cname varchar2(20) NOT NULL,
csurname varchar2(20) NOT NULL,
address varchar2(30),
city varchar2(15),
constraint customer_pk primary key(custno)
);

create table branch
(
bno number(4),
bname varchar2(20) NOT NULL,
city varchar2(20),
asset number(11,3),
constraint branch_pk primary key(bno),
constraint branch_chk check (asset > 0)
);

create table account
(
brno number(4),
acno number(6),
cno number(4),
openingDate date default sysdate,
balance number(11,3),
constraint account_pk primary key (brno,acno),
constraint account_fk1 foreign key(brno) references branch(bno),
constraint account_fk2 foreign key(cno) references customer(custno)
);

create table creditAccount
(
brnchno number(4),
loanno number(4),
cuno number(4),
amount number(11,3),
startDate date default sysdate,
endDate date,
noofInst number(2),
constraint creditAccount_pk primary key (brnchno, loanno),
constraint creditAccount_fk1 foreign key(brnchno) references branch(bno),
constraint creditAccount_fk2 foreign key(cuno) references customer(custno),
constraint creditAccount check(endDate > startDate)
);