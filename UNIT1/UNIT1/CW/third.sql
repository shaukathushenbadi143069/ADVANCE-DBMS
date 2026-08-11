--print name,surname,age
set serveroutput on;

declare

name char(18) :='divyaraj';
surname char(18) :='kathi';
age varchar2(18) :=18;

begin

dbms_output.put_line(name);
dbms_output.put_line(surname);
dbms_output.put_line(age);

end;
/
