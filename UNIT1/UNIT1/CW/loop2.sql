--write a program to print 100,98,80...0
set serveroutput on

declare

i number :=100;

begin

while i >= 0

loop

dbms_output.put_line(i);

i = i - 10;

end loop;
end;

/