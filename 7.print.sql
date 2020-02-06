create 
or replace procedure printExams is subjectid prof_table.subject_id % type;
subjectname prof_table.subjectname % type;
examdate prof_table.examdate % type;
studentsMax prof_table.studentsmax % type;
begin for c1 in(
  select 
    subject_id, 
    subjectname, 
    examdate, 
    studentsmax into subjectid, 
    subjectname, 
    examdate, 
    studentsMax 
  from 
    prof_table
) loop dbms_output.put_line(
  subjectid || ' ' || subjectname || ' ' || examdate || ' ' || studentsMax
);
end loop;
end;



create 
or replace procedure printRegisteredStundets is studentid registered_students.student_id % type;
subjectid registered_students.subject_id % type;
examdate registered_students.examdate % type;
begin for c1 in(
  select 
    student_id, 
    subject_id, 
    examdate into studentid, 
    subjectid, 
    examdate 
  from 
    registered_students
) loop dbms_output.put_line(
  studentid || ' ' || subjectid || ' ' || examdate
);
end loop;
end;


create 
or replace procedure printStudents is studentid students.studentid % type;
name_v students.name % type;
addre students.address % type;
phone students.phone % type;
begin for c1 in(
  select 
    studentid, 
    name, 
    address, 
    phone into studentid, 
    name_v, 
    addre, 
    phone 
  from 
    students
) loop dbms_output.put_line(
  studentid || ' ' || name_v || ' ' || addre || ' ' || phone
);
end loop;
end;



create 
or replace procedure printProfessors is profid professors.professorid % type;
name_v professors.name % type;
addre professors.professoraddress % type;
phone professors.phone % type;
begin for c1 in(
  select 
    professorid, 
    name, 
    professoraddress, 
    phone into profid, 
    name_v, 
    addre, 
    phone 
  from 
    professors
) loop dbms_output.put_line(
  profid || ' ' || name_v || ' ' || addre || ' ' || phone
);
end loop;
end;
