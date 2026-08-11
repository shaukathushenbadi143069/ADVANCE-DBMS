SET SERVEROUTPUT ON;

-- Create EMP_UPDATE table
CREATE TABLE EMP_UPDATE (
    EID NUMBER(5),
    EName VARCHAR2(30),
    OldBasicSal NUMBER(10,2),
    NewBasicSal NUMBER(10,2),
    UpdateDate DATE
);

-- Implicit Cursor
DECLARE
    v_count NUMBER;
BEGIN
    -- Increase salary by 5% for Department 20
    UPDATE EMP
    SET BasicSal = BasicSal * 1.05
    WHERE Deptno = 20;

    -- Check existence of records
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'No employee found in Department 20.'
        );
    ELSE
        v_count := SQL%ROWCOUNT;

        DBMS_OUTPUT.PUT_LINE(
            v_count || ' employee(s) found in Department 20.'
        );
        DBMS_OUTPUT.PUT_LINE(
            'Basic salary increased by 5%.'
        );

        -- Maintain records in EMP_UPDATE table
        INSERT INTO EMP_UPDATE
        SELECT EID,
               EName,
               BasicSal / 1.05,
               BasicSal,
               SYSDATE
        FROM EMP
        WHERE Deptno = 20;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE(
            'Salary update records maintained in EMP_UPDATE table.'
        );
    END IF;

    -- SQL implicit cursor is automatically closed
    IF SQL%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Implicit cursor is open.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Implicit cursor is closed.');
    END IF;
END;
/