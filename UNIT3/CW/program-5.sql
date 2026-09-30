set serveroutput on
declare
	name char(15):='&ename';
	s number(8,2);
	low_sal EXCEPTION;
begin
	select salary INTO s from emp where
	ename=name;
	dbms_output.put_line('Salary of :' ||name ||' is:'||s);
	if s < 25000 then
	RAISE low_sal;
	else
	dbms_output.put_line('Good Salary');
end if;
EXCEPTION
WHEN low_sal THEN
dbms_output.put_line(name ||'get low Salary');
end;
/