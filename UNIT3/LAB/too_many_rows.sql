--TOO_MANY_ROWS EXCEPTION
set serveroutput on
declare
	eno number(3):=&eno;
	d number(2);
	sal number(8,2);
begin
	select deptno,salary INTO d,sal from emp where empid=eno;
	dbms_output.put_line('employee id:'||eno||' Deptno:'||d||' Salary:'||sal);

	EXCEPTION
	WHEN NO_DATA_FOUND THEN
	dbms_output.put_line(eno||' is not found');
	WHEN TOO_MANY_ROWS THEN
	dbms_output.put_line(eno||' is found more than 1 times in table');
end;
/