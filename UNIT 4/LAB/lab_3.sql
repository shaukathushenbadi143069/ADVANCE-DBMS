create or replace procedure search_emp(id in number,enm out char)
is
begin
	select ename into enm from emp where empid=id;
exception
	when no_data_found then	
	dbms_output.put_line('ID Not Found');
end search_emp;
/