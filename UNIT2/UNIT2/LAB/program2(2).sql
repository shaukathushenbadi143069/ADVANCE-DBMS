SET SERVEROUTPUT ON;

DECLARE
    CURSOR emp_cur IS
        SELECT EID, EName, BasicSal
        FROM EMP
        WHERE Deptno = 20
        FOR UPDATE;

    v_eid       EMP.EID%TYPE;
    v_name      EMP.EName%TYPE;
    v_old_sal   EMP.BasicSal%TYPE;
    v_new_sal   EMP.BasicSal%TYPE;
    v_count     NUMBER := 0;
BEGIN
    OPEN emp_cur;

    -- Check whether cursor is open
    IF emp_cur%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Explicit cursor is open.');
    END IF;

    LOOP
        FETCH emp_cur
        INTO v_eid, v_name, v_old_sal;

        -- Check whether record exists
        IF emp_cur%NOTFOUND THEN
            EXIT;
        END IF;

        -- Calculate new salary
        v_new_sal := v_old_sal * 1.05;

        -- Update salary
        UPDATE EMP
        SET BasicSal = v_new_sal
        WHERE CURRENT OF emp_cur;

        -- Maintain update record
        INSERT INTO EMP_UPDATE
        VALUES (
            v_eid,
            v_name,
            v_old_sal,
            v_new_sal,
            SYSDATE
        );

        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE(
            'EID: ' || v_eid ||
            '  Name: ' || v_name ||
            '  Old Salary: ' || v_old_sal ||
            '  New Salary: ' || v_new_sal
        );
    END LOOP;

    CLOSE emp_cur;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'No employee found in Department 20.'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            v_count || ' employee(s) received a 5% salary raise.'
        );
        DBMS_OUTPUT.PUT_LINE(
            'Records maintained in EMP_UPDATE table.'
        );
    END IF;

    -- Check whether cursor is closed
    IF NOT emp_cur%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Explicit cursor is closed.');
    END IF;

    COMMIT;
END;
/