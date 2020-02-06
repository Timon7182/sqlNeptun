create 
or replace procedure addStudent(
  id in students.studentid % type, name in students.name % type, 
  address in students.address % type, 
  phone in students.phone % type, password in students.password % type, 
  username in students.username % type
) is id_exists exception;
idss number;
begin idss := 0;
select 
  id into idss 
from 
  professors 
where 
  professorid = id;
if idss = 0 then insert into students 
values 
  (
    id, name, address, phone, password, 
    username
  );
insert into logtable 
values 
  (id, username, 0);
else raise id_exists;
end if;
exception when id_exists then dbms_output.put_line('id exists');
end;



create 
or replace procedure addProfessor(
  id in professors.professorid % type, 
  name in professors.name % type, address in professors.professoraddress % type, 
  phone in professors.phone % type, password in professors.password % type, 
  username in professors.username % type
) is id_exists exception;
idss number;
begin idss := 0;
select 
  id into idss 
from 
  professors 
where 
  professorid = id;
if idss = 0 then insert into professors 
values 
  (
    id, name, address, phone, password, 
    username
  );
insert into logtable 
values 
  (id, username, 0);
else raise id_exists;
end if;
exception when id_exists then dbms_output.put_line('id exists');
end;




create 
or replace procedure addSubject(
  subjectName in subject.subject_name % type
) is begin insert into subject(subject_name) 
values 
  (subjectName);
end;

begin addSubject('Database3');
end;
