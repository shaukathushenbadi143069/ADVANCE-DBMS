Set serveroutput on
declare
    feet number;
    cm number;
    inch number;
    meter number;
begin
    feet := &feet;
    cm := feet * 30.48;
    inch := feet * 12;
    meter := feet * 0.3048;

   dbms_output.put_line('feet : ' || feet);
   dbms_output.put_line('cm : ' || cm);
   dbms_output.put_line('inch : ' || inch);
   dbms_output.put_line('meter : ' || meter);
end;
/