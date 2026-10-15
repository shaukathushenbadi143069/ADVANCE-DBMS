create or replace procedure sal_inc(xdeptno In number)
is
begin
update emp set salary=salary + (salary* 0.10) where deptno=xdeptno;
commit;
end sal_inc;
/