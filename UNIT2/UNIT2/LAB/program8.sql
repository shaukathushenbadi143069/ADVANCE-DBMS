SET SERVEROUTPUT ON;

BEGIN
    FOR emp_rec IN (
        SELECT EID, EName, Deptname, BasicSal
        FROM EMP
        WHERE EName LIKE 'A%'
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'EID: ' || emp_rec.EID ||
            ' | Name: ' || emp_rec.EName ||
            ' | Department: ' || emp_rec.Deptname ||
            ' | Basic Salary: Rs. ' || emp_rec.BasicSal
        );
    END LOOP;
END;
/