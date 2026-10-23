create or replace trigger def2
before insert on emp_sal
for each row
begin
	if :NEW.salary > 50000 then
	Raise_application_error(-20010,'You dont have rights to enter salary above 50000');
	end if;
end def2;
/