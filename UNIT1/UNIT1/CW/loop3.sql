--write a program that printf 1 to 5 using loop/simple loop
set serveroutput on

declare

i number :=1;
n number :=n;

begin
loop

dbms_output.put_line(i);
i:=i+1;
exit when(i>n);
end loop;
end;
/