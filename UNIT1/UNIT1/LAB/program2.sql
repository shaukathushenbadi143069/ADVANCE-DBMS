--square-cube

set serveroutput on

declare

square number :=&number;
cube number :=&cub;

sq number;
cub number;



begin 
	sq := (square * square);
	cub :=(cube * cube * cube);

	dbms_output.put_line(square);
	dbms_output.put_line(sq);
	dbms_output.put_line(cube);
	dbms_output.put_line(cub);

end;

/