SET SERVEROUTPUT ON;


    CURSOR c_emp IS
        SELECT *
        FROM emp
        WHERE gender = 'Male'
          AND dept = 'HR';

    v_emp c_emp%ROWTYPE;

BEGIN
    OPEN c_emp;

    LOOP
        FETCH c_emp INTO v_emp;
        EXIT WHEN c_emp%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Emp No : ' || v_emp.empno ||
            '  Name : ' || v_emp.ename ||
            '  Gender : ' || v_emp.gender ||
            '  Department : ' || v_emp.dept
        );
    END LOOP;

    CLOSE c_emp;
END;
/