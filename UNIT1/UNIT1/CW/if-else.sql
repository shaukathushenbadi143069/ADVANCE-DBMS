--calculate commision of salaer between 10000 to 50000 else 0

set serveroutput on;

DECLARE
    salary NUMBER;
    commission NUMBER;
BEGIN
    salary := &salary;

    IF salary >= 10000 AND salary <= 50000 THEN
        commission := salary * 0.10;
    ELSE
        commission := 0;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Salary = ' || salary);
    DBMS_OUTPUT.PUT_LINE('Commission = ' || commission);
END;
/
