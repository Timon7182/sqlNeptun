CREATE or replace PACKAGE additems 
AS 
  PROCEDURE addexam( 
    id_d          IN subject.subject_id % TYPE, 
    max_students  IN NUMBER, 
    date_d        IN VARCHAR2, 
    professorid_v IN professors.professorid % TYPE ); 
  PROCEDURE addprofessor( 
    id       IN professors.professorid % TYPE, 
    name     IN professors.name % TYPE, 
    address  IN professors.professoraddress % TYPE, 
    phone    IN professors.phone % TYPE, 
    password IN professors.password % TYPE, 
    username IN professors.username % TYPE ); 
  PROCEDURE addstudent( 
    id       IN students.studentid % TYPE, 
    name     IN students.name % TYPE, 
    address  IN students.address % TYPE, 
    phone    IN students.phone % TYPE, 
    password IN students.password % TYPE, 
    username IN students.username % TYPE ); 
  PROCEDURE addsubject( 
    subjectname IN subject.subject_name % TYPE ); 
END additems; 


CREATE OR replace PACKAGE BODY additems 
AS 
  PROCEDURE Addexam(id_d          IN subject.subject_id % TYPE, 
                    max_students  IN NUMBER, 
                    date_d        IN VARCHAR2, 
                    professorid_v IN professors.professorid % TYPE) 
  IS 
    name_v     subject.subject_name % TYPE; 
    date_v     DATE; 
    username_v logtable.username % TYPE; 
    notloggedin EXCEPTION; 
  BEGIN 
      SELECT subject_name 
      INTO   name_v 
      FROM   subject 
      WHERE  subject_id = id_d; 

      SELECT username 
      INTO   username_v 
      FROM   professors 
      WHERE  professorid = professorid_v; 

      date_v := SYSDATE(); 

      IF Checklog(professorid_v, username_v) THEN 
        INSERT INTO prof_table 
        VALUES      ( id_d, 
                     name_v, 
                     date_d, 
                     date_v, 
                     max_students, 
                     professorid_v ); 

        dbms_output.Put_line('Subject ' 
                             || name_v 
                             || ' Created'); 
      ELSE 
        RAISE notloggedin; 
      END IF; 
  EXCEPTION 
    WHEN notloggedin THEN 
               dbms_output.Put_line('not logged in'); WHEN no_data_found THEN 
               dbms_output.Put_line('not exist id '); 
  END addexam; 
  PROCEDURE Addprofessor(id       IN professors.professorid % TYPE, 
                         name     IN professors.name % TYPE, 
                         address  IN professors.professoraddress % TYPE, 
                         phone    IN professors.phone % TYPE, 
                         password IN professors.password % TYPE, 
                         username IN professors.username % TYPE) 
  IS 
    id_exists EXCEPTION; 
    idss NUMBER; 
  BEGIN 
      idss := 0; 

      SELECT id 
      INTO   idss 
      FROM   professors 
      WHERE  professorid = id; 

      IF idss = 0 THEN 
        INSERT INTO professors 
        VALUES      ( id, 
                     name, 
                     address, 
                     phone, 
                     password, 
                     username ); 

        INSERT INTO logtable 
        VALUES      (id, 
                     username, 
                     0); 
      ELSE 
        RAISE id_exists; 
      END IF; 
  EXCEPTION 
    WHEN id_exists THEN 
               dbms_output.Put_line('id exists'); 
  END addprofessor; 
  PROCEDURE Addstudent(id       IN students.studentid % TYPE, 
                       name     IN students.name % TYPE, 
                       address  IN students.address % TYPE, 
                       phone    IN students.phone % TYPE, 
                       password IN students.password % TYPE, 
                       username IN students.username % TYPE) 
  IS 
    id_exists EXCEPTION; 
    idss NUMBER; 
  BEGIN 
      idss := 0; 

      SELECT id 
      INTO   idss 
      FROM   professors 
      WHERE  professorid = id; 

      IF idss = 0 THEN 
        INSERT INTO students 
        VALUES      ( id, 
                     name, 
                     address, 
                     phone, 
                     password, 
                     username ); 

        INSERT INTO logtable 
        VALUES      (id, 
                     username, 
                     0); 
      ELSE 
        RAISE id_exists; 
      END IF; 
  EXCEPTION 
    WHEN id_exists THEN 
               dbms_output.Put_line('id exists'); 
  END addstudent; 
  PROCEDURE Addsubject(subjectname IN subject.subject_name % TYPE) 
  IS 
  BEGIN 
      INSERT INTO subject 
                  (subject_name) 
      VALUES      (subjectname); 
  END addsubject; 
END additems; 