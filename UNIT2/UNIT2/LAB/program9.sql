SET SERVEROUTPUT ON;

DECLARE
    -- Variables
    v_eid       EMP.EID%TYPE;
    v_name      EMP.EName%TYPE;
    v_dept      EMP.Deptname%TYPE;
    v_salary    EMP.BasicSal%TYPE;

    -- Explicit Cursor with ORDER BY
    CURSOR emp_cur IS
        SELECT EID, EName, Deptname, BasicSal
        FROM EMP
        ORDER BY BasicSal ASC;

BEGIN
    -- Open cursor
    OPEN emp_cur;

    LOOP
        -- Fetch record
        FETCH emp_cur
        INTO v_eid, v_name, v_dept, v_salary;

        -- Exit when no more records
        EXIT WHEN emp_cur%NOTFOUND;

        -- Display record
        DBMS_OUTPUT.PUT_LINE(
            'EID: ' || v_eid ||
            ' | Name: ' || v_name ||
            ' | Department: ' || v_dept ||
            ' | Basic Salary: Rs. ' || v_salary
        );
    END LOOP;

    -- Close cursor
    CLOSE emp_cur;
END;
/