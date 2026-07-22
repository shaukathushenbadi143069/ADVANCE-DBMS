--program to find square and club of number
set serveroutput on
declare
    num number:=&num;
    sq number;
    cube NUMBER;

begin
    sq:=num*num;
    cube:=num*num*num;

dbms_output.put_line('Entered Number:'||num);
dbms_output.put_line('square of number:'||sq);
dbms_output.put_line('cube of number:'||cube);
end;
/