--simple interest

set serveroutput on

declare

amount number := 10000;
interest number := 7;
year number := 3;

simp number;

begin 
	simp := (amount * interest * year)/ 100;

	dbms_output.put_line(amount);
	dbms_output.put_line(interest);
	dbms_output.put_line(year);
	dbms_output.put_line(simp);

end;

/