create or replace procedure inc_sal(xdeptno In number,per in number)
is
begin
update emp set salary=salary + (salary * (per/100)) where deptno=xdeptno;
commit;
end inc_sal;
/