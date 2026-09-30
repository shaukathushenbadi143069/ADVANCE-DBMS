set serveroutput on
declare
	per number:=&per;
	res_fail EXCEPTION; 
begin
	dbms_output.put_line('percentage:'||per);
	if per >= 40 then
	dbms_output.put_line('Result:Pass');
	else
	RAISE res_fail;
end if;
EXCEPTION
WHEN res_fail then
dbms_output.put_line('Result:Fail');
end;