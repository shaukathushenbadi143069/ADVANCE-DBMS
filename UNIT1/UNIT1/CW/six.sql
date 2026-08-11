--print name,address1, address2, city,state of user

set serveroutput on;

declare

	name char(18):='&name';
	address1 char(18):='&address1';
	address2 char(18):='&addess2';
	city char(18):='&city';
	state char(18):='&state';

begin

	dbms_output.put_line( name);
	dbms_output.put_line( address1);
	dbms_output.put_line( address2);
	dbms_output.put_line( city);
	dbms_output.put_line( state);


end;

/
	