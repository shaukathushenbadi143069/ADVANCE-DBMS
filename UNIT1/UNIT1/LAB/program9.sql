SET SERVEROUTPUT ON;

DECLARE
BEGIN
    FOR E IN (
        SELECT *
        FROM EMP
        WHERE Gender = 'Male'
        AND Deptname = 'HR'
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'EID: ' || E.EID ||
            ', Name: ' || E.EName ||
            ', Deptno: ' || E.Deptno ||
            ', Deptname: ' || E.Deptname ||
            ', Gender: ' || E.Gender ||
            ', Age: ' || E.Age ||
            ', Basic Salary: ' || E.BasicSal
        );
    END LOOP;
END;
/