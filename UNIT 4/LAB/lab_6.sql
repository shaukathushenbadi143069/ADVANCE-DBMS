create or replace procedure update_emp
is
begin
update emp set salary = salary + 500;
end update_emp;
/