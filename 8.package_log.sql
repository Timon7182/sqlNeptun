CREATE PACKAGE loginoff 
AS 
  PROCEDURE loginprofessor( 
    id_v IN NUMBER, 
    pass IN VARCHAR2); 
  PROCEDURE loginstudent( 
    id_v IN NUMBER, 
    pass IN VARCHAR2); 
  PROCEDURE logoffprofessor( 
    id_v IN NUMBER); 
  PROCEDURE logoffstudent( 
    id_v IN NUMBER); 
END loginoff; 

CREATE OR replace PACKAGE BODY loginoff 
AS 
  PROCEDURE Loginprofessor(id_v IN NUMBER, 
                           pass IN VARCHAR2) 
  IS 
    passaux    professors.password%TYPE; 
    username_v professors.username%TYPE; 
  BEGIN 
      SELECT password 
      INTO   passaux 
      FROM   professors 
      WHERE  professorid = id_v; 

      SELECT username 
      INTO   username_v 
      FROM   professors 
      WHERE  professorid = id_v; 

      IF passaux = pass THEN 
        dbms_output.Put_line('User ' 
                             || USER 
                             || ' loging succesfull'); 

        UPDATE logtable 
        SET    typelog = 1 
        WHERE  id = id_v 
               AND username = username_v; 
      ELSE 
        dbms_output.Put_line('Password incorrect'); 
      END IF; 
  EXCEPTION 
    WHEN no_data_found THEN 
               dbms_output.Put_line('User incorrect'); 
  END loginprofessor; 
  PROCEDURE Loginstudent(id_v IN NUMBER, 
                         pass IN VARCHAR2) 
  IS 
    passaux    students.password%TYPE; 
    username_v students.username%TYPE; 
  BEGIN 
      SELECT password 
      INTO   passaux 
      FROM   students 
      WHERE  studentid = id_v; 

      SELECT username 
      INTO   username_v 
      FROM   students 
      WHERE  studentid = id_v; 

      IF passaux = pass THEN 
        dbms_output.Put_line('User ' 
                             || USER 
                             || ' loging succesfull'); 

        UPDATE logtable 
        SET    typelog = 1 
        WHERE  id = id_v 
               AND username = username_v; 
      ELSE 
        dbms_output.Put_line('Password incorrect'); 
      END IF; 
  EXCEPTION 
    WHEN no_data_found THEN 
               dbms_output.Put_line('User incorrect'); 
  END loginstudent; 
  PROCEDURE Logoffprofessor(id_v IN NUMBER) 
  IS 
    username_v professors.username%TYPE; 
  BEGIN 
      SELECT username 
      INTO   username_v 
      FROM   professors 
      WHERE  professorid = id_v; 

      dbms_output.Put_line('User ' 
                           || USER 
                           || ' logoff succesfull'); 

      UPDATE logtable 
      SET    typelog = 0 
      WHERE  id = id_v 
             AND username = username_v; 
  EXCEPTION 
    WHEN no_data_found THEN 
               dbms_output.Put_line('User incorrect'); 
  END logoffprofessor; 
  PROCEDURE Logoffstudent(id_v IN NUMBER) 
  IS 
    username_v students.username%TYPE; 
  BEGIN 
      SELECT username 
      INTO   username_v 
      FROM   students 
      WHERE  studentid = id_v; 

      dbms_output.Put_line('User ' 
                           || USER 
                           || ' logoff succesfull'); 

      UPDATE logtable 
      SET    typelog = 0 
      WHERE  id = id_v 
             AND username = username_v; 
  EXCEPTION 
    WHEN no_data_found THEN 
               dbms_output.Put_line('User incorrect'); 
  END logoffstudent; 
END loginoff; 