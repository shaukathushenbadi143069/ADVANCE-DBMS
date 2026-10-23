--User insert record in EMP  the same data enter in NEWEMP
Create or replace trigger trig_copy
before INSERT on EMP
for each row
begin
	Insert into NEWEMP values(:New.enp_no,:New.emp_name,:New.dept_no;New.salary);
end trig_copy;
/