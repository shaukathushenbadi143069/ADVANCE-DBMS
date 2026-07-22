--program to calcultate comm
set serveroutput on
clear screen
declare
xsno number(3):=&xsno;
s number(5);
begin
select sales into s from sdata where sro=xsno;
if s >= 10000 and s <=30000
then
update sdata set comm=(s*0.10) where sro=xsno;
commit;
else
update sdata set comm=0 where sro=xsno;
commit;
end if;
dbms_output.put_line('Record Updated');
end;
/