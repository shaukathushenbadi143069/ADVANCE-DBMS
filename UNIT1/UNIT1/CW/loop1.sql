SET SERVEROUTPUT ON;

DECLARE
    i NUMBER := 1;
    n NUMBER := &n;
BEGIN
    WHILE i <= n
    LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 2;
    END LOOP;
END;
/