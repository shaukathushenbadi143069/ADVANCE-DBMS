set serveroutput on
declare
	id number:=&id;
	enm char(50);

begin
	search_emp(id,enm);
	dbms_output.put_line('Employee Name Is : '||enm);
end;
/