--program to update result using simple if set serveroutput on
declare
	xrlno number(3):=&xrlno;
	p number(3);

begin
	select per into p from marks where rlno=xrlno;
if p>=40
then 
	update marks set result='pass'where rlno=xrlno;

commit;
	dbms_output.put_line('result update');

end if;

end;

/