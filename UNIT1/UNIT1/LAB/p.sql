SET SERVEROUTPUT ON;

DECLARE
    i NUMBER(3) := 1;
BEGIN
    WHILE i <= 5
    LOOP
        INSERT INTO cust
        VALUES (i, i * i, i * i * i);

        i := i + 1;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Records inserted successfully');
END;
/