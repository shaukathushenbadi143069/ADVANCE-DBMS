create or replace trigger up_Trig
before
UPDATE on emp
for each row
begin
insert into NEWEMP values(:Old.enp_no,:Old.emp_name,:Old.dept_no;Old.salary);
end up_trig;
/