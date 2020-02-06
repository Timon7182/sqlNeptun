create 
or replace procedure registerToExam(
  subjectid_v in number, studentid_v in number
) is username_v students.username % type;
examdate_v prof_table.examdate % type;
begin 
select 
  username into username_v 
from 
  students 
where 
  studentid = studentid_v;
select 
  examdate into examdate_v 
from 
  prof_table 
where 
  subject_id = subjectid_v;
if checkLog(studentid_v, username_v) then if exists_student(subjectid_v, studentid_v) then dbms_output.put_line('U already registered');
else insert into registered_students(student_id, subject_id, examdate) 
values 
  (
    studentid_v, subjectid_v, examdate_v
  );
end if;
else dbms_output.put_line('U didnt login');
end if;
exception when no_data_found then dbms_output.put_line('error');
end;
