--write a program that printf square of number using loop
set serveroutput on

declare

i number :=1;
n number := 10;

begin

loop

j:= n * n;
dbms_output.put_line(i * i);

exit when (i>n);

end loop;
end;
/