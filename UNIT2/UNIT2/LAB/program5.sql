SET SERVEROUTPUT ON;

DECLARE
    -- Parameterized cursor
    CURSOR emp_cur(p_deptno EMP.Deptno%TYPE) IS
        SELECT EName, BasicSal
        FROM EMP
        WHERE Deptno = p_deptno;

    v_total_salary NUMBER := 0;
BEGIN
    -- Department-wise processing
    FOR d IN (
        SELECT DISTINCT Deptno, Deptname
        FROM EMP
        ORDER BY Deptno
    )
    LOOP
        v_total_salary := 0;

        DBMS_OUTPUT.PUT_LINE('Department No   : ' || d.Deptno);
        DBMS_OUTPUT.PUT_LINE('Department Name : ' || d.Deptname);
        DBMS_OUTPUT.PUT_LINE('--------------------------------');

        -- Parameterized cursor FOR loop
        FOR e IN emp_cur(d.Deptno)
        LOOP
            DBMS_OUTPUT.PUT_LINE(
                'Employee Name: ' || e.EName ||
                '  Basic Salary: Rs. ' || e.BasicSal
            );

            v_total_salary := v_total_salary + e.BasicSal;
        END LOOP;

        DBMS_OUTPUT.PUT_LINE(
            'Department Total Basic Salary: Rs. ' || v_total_salary
        );

        DBMS_OUTPUT.PUT_LINE('================================');
    END LOOP;
END;
/