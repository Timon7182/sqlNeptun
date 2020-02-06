create 
or replace procedure loginStudent(id_v in number, pass in varchar2) is passAux students.password % TYPE;
username_v students.username % type;
BEGIN 
SELECT 
  password INTO passAux 
FROM 
  students 
WHERE 
  studentid = id_v;
select 
  username into username_v 
from 
  students 
where 
  studentid = id_v;
IF passAux = pass THEN DBMS_OUTPUT.PUT_LINE(
  'User ' || user || ' loging succesfull'
);
update 
  logtable 
set 
  typelog = 1 
where 
  id = id_v 
  and username = username_v;
ELSE DBMS_OUTPUT.PUT_LINE('Password incorrect');
END IF;
EXCEPTION WHEN no_data_found THEN DBMS_OUTPUT.PUT_LINE('User incorrect');
end;



create 
or replace procedure logoffStudent(id_v in number) is username_v students.username % type;
BEGIN 
select 
  username into username_v 
from 
  students 
where 
  studentid = id_v;
DBMS_OUTPUT.PUT_LINE(
  'User ' || user || ' logoff succesfull'
);
update 
  logtable 
set 
  typelog = 0 
where 
  id = id_v 
  and username = username_v;
EXCEPTION WHEN no_data_found THEN DBMS_OUTPUT.PUT_LINE('User incorrect');
end;



create 
or replace procedure loginProfessor(id_v in number, pass in varchar2) is passAux professors.password % TYPE;
username_v professors.username % type;
BEGIN 
SELECT 
  password INTO passAux 
FROM 
  professors 
WHERE 
  professorid = id_v;
select 
  username into username_v 
from 
  professors 
where 
  professorid = id_v;
IF passAux = pass THEN DBMS_OUTPUT.PUT_LINE(
  'User ' || user || ' loging succesfull'
);
update 
  logtable 
set 
  typelog = 1 
where 
  id = id_v 
  and username = username_v;
ELSE DBMS_OUTPUT.PUT_LINE('Password incorrect');
END IF;
EXCEPTION WHEN no_data_found THEN DBMS_OUTPUT.PUT_LINE('User incorrect');
end;



create 
or replace procedure logoffProfessor(id_v in number) is username_v professors.username % type;
BEGIN 
select 
  username into username_v 
from 
  professors 
where 
  professorid = id_v;
DBMS_OUTPUT.PUT_LINE(
  'User ' || user || ' logoff succesfull'
);
update 
  logtable 
set 
  typelog = 0 
where 
  id = id_v 
  and username = username_v;
EXCEPTION WHEN no_data_found THEN DBMS_OUTPUT.PUT_LINE('User incorrect');
end;
