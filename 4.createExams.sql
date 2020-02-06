create 
or replace procedure createProfessorSubjects(profid in number) is var2 varchar2(4000);
username_v logtable.username % type;
notloggedin exception;
begin 
select 
  username into username_v 
from 
  professors 
where 
  professorid = profid;
if checkLog(profid, username_v) then var2 := 'create table prof_table(
subject_id number,
subjectName varchar(40),
examDate varchar(40),
creationDate date,
studentsMax number,
professorId number,
CONSTRAINT fk_table_sub
    FOREIGN KEY (subject_id)
    REFERENCES Subject(subject_id)
)';
EXECUTE IMMEDIATE var2;
else raise notloggedin;
end if;
exception when notloggedin then dbms_output.put_line('not logged in');
when no_data_found then dbms_output.put_line('not exist id ');
end;
begin createprofessorsubjects(6);
end;



create 
or replace procedure addExam(
  id_d in subject.subject_id % type, max_students in number, 
  date_d in varchar2, professorId_v in professors.professorid % type
) is name_v subject.subject_name % type;
date_v date;
username_v logtable.username % type;
notloggedin exception;
begin 
select 
  subject_name into name_v 
from 
  subject 
where 
  subject_id = id_d;
select 
  username into username_v 
from 
  professors 
where 
  professorid = professorId_v;
date_v := SYSDATE();
if checkLog(professorId_v, username_v) then insert into prof_table 
values 
  (
    id_d, name_v, date_d, date_v, max_students, 
    professorId_v
  );
DBMS_OUTPUT.PUT_LINE('Subject ' || name_v || ' Created');
else raise notloggedin;
end if;
exception when notloggedin then dbms_output.put_line('not logged in');
when no_data_found then dbms_output.put_line('not exist id ');
end;
