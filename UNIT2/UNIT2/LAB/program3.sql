SET SERVEROUTPUT ON;

DECLARE
    -- Explicit cursor
    CURSOR emp_cur IS
        SELECT EName, Deptname, BasicSal
        FROM EMP
        ORDER BY BasicSal DESC;

    v_name      EMP.EName%TYPE;
    v_dept      EMP.Deptname%TYPE;
    v_salary    EMP.BasicSal%TYPE;
BEGIN
    OPEN emp_cur;

    LOOP
        FETCH emp_cur INTO v_name, v_dept, v_salary;

        -- Stop when no more records
        EXIT WHEN emp_cur%NOTFOUND;

        -- Display employee details
        DBMS_OUTPUT.PUT_LINE(
            'Employee Name: ' || v_name ||
            ' | Department: ' || v_dept ||
            ' | Basic Salary: Rs. ' || v_salary
        );

        -- Stop after first 5 employees
        EXIT WHEN emp_cur%ROWCOUNT = 5;
    END LOOP;

    -- Display number of records
    DBMS_OUTPUT.PUT_LINE(
        'Total Employees Displayed: ' || emp_cur%ROWCOUNT
    );

    CLOSE emp_cur;
END;
/