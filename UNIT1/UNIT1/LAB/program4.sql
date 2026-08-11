--feet,cm,inch,meter

set serveroutput on

declare

cm number;
feet number := &feet;
inch number;
meter number;

begin

cm := feet * 30.48;
inch := feet * 12;
meter := feet * 0.3048;

	dbms_output.put_line(feet);
	dbms_output.put_line(cm);
	dbms_output.put_line(inch);
	dbms_output.put_line(meter);

end;
/
