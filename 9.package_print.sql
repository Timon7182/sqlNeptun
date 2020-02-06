CREATE PACKAGE printi 
AS 
  PROCEDURE printexams; 
  PROCEDURE printprofessors; 
  PROCEDURE printregisteredstundets; 
  PROCEDURE printstudents; 
END printi; 

CREATE OR replace PACKAGE BODY printi 
AS 
  PROCEDURE Printexams 
  IS 
    subjectid   prof_table.subject_id % TYPE; 
    subjectname prof_table.subjectname % TYPE; 
    examdate    prof_table.examdate % TYPE; 
    studentsmax prof_table.studentsmax % TYPE; 
  BEGIN 
      FOR c1 IN(SELECT subject_id, 
                       subjectname, 
                       examdate, 
                       studentsmax 
                INTO   subjectid, subjectname, examdate, studentsmax 
                FROM   prof_table) LOOP 
          dbms_output.Put_line(subjectid 
                               || ' ' 
                               || subjectname 
                               || ' ' 
                               || examdate 
                               || ' ' 
                               || studentsmax); 
      END LOOP; 
  END printexams; 
  PROCEDURE Printprofessors 
  IS 
    profid professors.professorid % TYPE; 
    name_v professors.name % TYPE; 
    addre  professors.professoraddress % TYPE; 
    phone  professors.phone % TYPE; 
  BEGIN 
      FOR c1 IN(SELECT professorid, 
                       name, 
                       professoraddress, 
                       phone 
                INTO   profid, name_v, addre, phone 
                FROM   professors) LOOP 
          dbms_output.Put_line(profid 
                               || ' ' 
                               || name_v 
                               || ' ' 
                               || addre 
                               || ' ' 
                               || phone); 
      END LOOP; 
  END printprofessors; 
  PROCEDURE Printregisteredstundets 
  IS 
    studentid registered_students.student_id % TYPE; 
    subjectid registered_students.subject_id % TYPE; 
    examdate  registered_students.examdate % TYPE; 
  BEGIN 
      FOR c1 IN(SELECT student_id, 
                       subject_id, 
                       examdate 
                INTO   studentid, subjectid, examdate 
                FROM   registered_students) LOOP 
          dbms_output.Put_line(studentid 
                               || ' ' 
                               || subjectid 
                               || ' ' 
                               || examdate); 
      END LOOP; 
  END printregisteredstundets; 
  PROCEDURE Printstudents 
  IS 
    studentid students.studentid % TYPE; 
    name_v    students.name % TYPE; 
    addre     students.address % TYPE; 
    phone     students.phone % TYPE; 
  BEGIN 
      FOR c1 IN(SELECT studentid, 
                       name, 
                       address, 
                       phone 
                INTO   studentid, name_v, addre, phone 
                FROM   students) LOOP 
          dbms_output.Put_line(studentid 
                               || ' ' 
                               || name_v 
                               || ' ' 
                               || addre 
                               || ' ' 
                               || phone); 
      END LOOP; 
  END printstudents; 
END printi; 