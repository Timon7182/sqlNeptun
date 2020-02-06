CREATE TABLE Professors(
  professorID NUMBER, 
  name VARCHAR2(40), 
  professorAddress VARCHAR2(50), 
  phone NUMBER(9), 
  password VARCHAR2(20), 
  userName VARCHAR2(10), 
  CONSTRAINT Professors_PK PRIMARY KEY (professorID)
);


Commit;


INSERT INTO Professors 
VALUES 
  (
    1, 'ALFRED', 'BACON STREET', 623623623, 
    'alfred123', 'al1'
  );
INSERT INTO Professors 
VALUES 
  (
    2, 'JAMES', 'DOWNTOWN ABBEY', 659659659, 
    'james123', 'ja2'
  );
INSERT INTO Professors 
VALUES 
  (
    14, 'GEORGE', 'DETROIT CITY', 654654654, 
    'george123', 'ge3'
  );
INSERT INTO Professors 
VALUES 
  (
    4, 'TOM', 'WASHINGTON DC.', 658658658, 
    'tom123', 'tom4'
  );
INSERT INTO Professors 
VALUES 
  (
    5, 'PETER', 'CASTERLY ROCK', 652652652, 
    'peter123', 'pe5'
  );
INSERT INTO Professors 
VALUES 
  (
    6, 'Tamas', 'Budapest', 123456789, 
    'tamas123', 'ta6'
  );
  
  
commit;



create table Subject(
  subject_id NUMBER, 
  subject_name VARCHAR2(40), 
  CONSTRAINT Subject_PK PRIMARY KEY (subject_id)
);


Commit;


create sequence ids_subject_seq start with 1 increment by 1;



create 
or replace TRIGGER ADDINGSUBJECT BEFORE INSERT ON SUBJECT REFERENCING NEW AS NEW OLD AS OLD for each row BEGIN 
select 
  ids_subject_seq.nextval into : new.subject_id 
from 
  dual;
END;



insert into Subject(subject_name) 
Values 
  ('Assembly Language');
insert into Subject(subject_name) 
Values 
  ('IT Security');
insert into Subject(subject_name) 
Values 
  ('Database1');
  
  
  
commit;



CREATE TABLE Students(
  studentID NUMBER, 
  name VARCHAR2(40), 
  address VARCHAR2(50), 
  phone NUMBER(9), 
  password VARCHAR2(20), 
  userName VARCHAR2(10), 
  CONSTRAINT Students_PK PRIMARY KEY (studentID)
);



Commit;



Insert into Students 
values 
  (
    1, 'Danika', 'szigeti', 123456789, 
    'dan123', 'dan'
  );
  
  
  
create table logTable(
  id number(3), 
  username varchar(30), 
  typeLog number(1)
);


insert into logTable 
values 
  (1, 'al1', 0);
insert into logTable 
values 
  (2, 'ja2', 0);
insert into logTable 
values 
  (14, 'ge3', 0);
insert into logTable 
values 
  (4, 'tom4', 0);
insert into logTable 
values 
  (5, 'pe5', 0);
insert into logTable 
values 
  (1, 'dan', 0);
insert into logTable 
values 
  (6, 'ta6', 1);
  
  
create table registered_students(
  student_id number, 
  subject_id number, 
  examdate varchar2(10)
);
