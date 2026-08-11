--program two number do addition,multiply,divide,substract

set serveroutput on;

declare

n1 number :=&n1;
n2 number :=&n2;

sum number;
sub number;
multy number;
division number;

begin

	sum :=n1 + n2;
	sub :=n1 - n2;
	multy :=n1 * n2;
	divison :=n1/n2;



	dbms_output.put_line(sum);
	dbms_output.put_line(sub);
	dbms_output.put_line(multy);
	dbms_output.put_line(division);

end;

/

end;

/

