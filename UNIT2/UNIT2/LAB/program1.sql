SET SERVEROUTPUT ON;

BEGIN
    -- Increase Basic Salary by 10% for employees
    -- working in Department 10
    UPDATE EMP
    SET BasicSal = BasicSal * 1.10
    WHERE Deptno = 10;

    -- Check whether any record was updated
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            SQL%ROWCOUNT || ' employee(s) found in Department 10.'
        );
        DBMS_OUTPUT.PUT_LINE(
            'Basic salary increased by 10% successfully.'
        );
        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'No employee found in Department 10.'
        );
    END IF;
END;
/