set serveroutput on
declare
	age number:=&age;
	check_age EXCEPTION;
begin
	dbms_output.put_line('Entered age is:'||age);
	if age >= 18 then
	dbms_output.put_line('Eligible for vote');
	else
	RAISE check_age; --raise user
end if;
EXCEPTION
WHEN check_age then
dbms_output.put_line('You are not Eligible
for vote');
end;
/