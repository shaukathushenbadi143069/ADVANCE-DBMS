create or replace trigger del_Trig
before
DELETE on emp
for each row
begin
insert into NEWEMP values(:Old.enp_no,:Old.emp_name,:Old.dept_no;Old.salary);
end del_trig;
/