--already open cursor in emp
set serveroutput on
declare
	cursor cr1 IS select * from emp where salary > 60000;
	s emp%ROWTYPE;
begin
open cr1;
open cr1;
loop
	fetch cr1 into s;
	exit when cr1%NOTFOUND;
	dbms_output.put_line('employee id:'||s.EMPID||'employee name:'||s.EMPNAME||'department no:'||s.DEPTNO||'salary:'||s.SALARY);
end loop;
close cr1;
	EXCEPTION
	WHEN CURSOR_ALREADY_OPEN THEN
	dbms_output.put_line('You opened cursor multiple times in program');
end;
/