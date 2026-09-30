--ALREADY OPEN EXCEPTION
set serveroutput on
declare
	cursor cr1 IS select * from booking where amount > 5000;
	b booking%ROWTYPE;
begin
open cr1;
open cr1;
loop
	fetch cr1 into b;
	exit when cr1%NOTFOUND;
	dbms_output.put_line('Customer Name:'||b.CUSTOMER_NAME||'DESTINATION:' ||b.DESTINATION||' Amount:'|| b.amount);
end loop;
close cr1;
	EXCEPTION
	WHEN CURSOR_ALREADY_OPEN THEN
	dbms_output.put_line('You opened cursor multiple times in program');
end;
/