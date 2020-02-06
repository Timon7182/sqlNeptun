create 
or replace function checkLog(
  id_v in number, username_v in varchar2
) return boolean is res boolean := false;
num number;
begin 
select 
  typelog into num 
from 
  logtable 
where 
  id = id_v 
  and username = username_v;
if num = 1 then res := true;
else res := false;
end if;
return (res);
end;


create 
or replace function exists_student(
  id_subject in number, id_student in number
) return boolean is res boolean := false;
begin for c1 in(
  select 
    1 
  from 
    registered_students 
  where 
    student_id = id_student 
    and subject_id = id_subject
) loop res := true;
exit;
end loop;
return (res);
end;
