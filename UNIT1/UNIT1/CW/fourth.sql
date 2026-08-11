--print two variable but at startside
set serveroutput on;

declare

course varchar2(18):='BCA';
semester varchar2(18):=2;

begin
dbms_output.put_line(course);
dbms_output.put_line(semester);


end;
/