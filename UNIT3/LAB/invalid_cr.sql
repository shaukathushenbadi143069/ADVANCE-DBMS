--INVALID CURSOR EXCEPTION
set serveroutput on
declare 
	cursor cr1 IS select * from booking where amount>5000;
	b booking%ROWTYPE;
begin
open cr1;
loop
	fetch cr1 INTO b;
	exit when cr1%NOTFOUND;
	dbms_output.put_line('Customer Name:'||b.customer_name||'Destination:'||b.destination||'Journey date:'||b.booking_date||'Amount:'||b.amount);
end loop;
close cr1;

EXCEPTION
	WHEN INVALID_CURSOR THEN
	dbms_output.put_line('you forget to open cursor and open re-execute program');

end;
/