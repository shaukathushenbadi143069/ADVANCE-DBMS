SET SERVEROUTPUT ON;

-- Create backup table
CREATE TABLE EMP_BACKUP (
    EID NUMBER(5),
    EName VARCHAR2(30),
    Deptno NUMBER(5),
    Deptname VARCHAR2(30),
    Gender VARCHAR2(10),
    Age NUMBER(3),
    BasicSal NUMBER(10,2)
);

-- PL/SQL Program
DECLARE
    -- User-defined exception
    NO_DEPT_FOUND EXCEPTION;

    -- Variable for department number
    v_deptno EMP.Deptno%TYPE := &DEPT_NO;

    v_count NUMBER := 0;

    -- Explicit cursor
    CURSOR emp_cur IS
        SELECT EID, EName, Deptno, Deptname,
               Gender, Age, BasicSal
        FROM EMP
        WHERE Deptno = v_deptno;

BEGIN
    -- Open cursor
    OPEN emp_cur;

    LOOP
        FETCH emp_cur INTO
            v_eid, v_name, v_deptno2,
            v_deptname, v_gender, v_age, v_basic;

        EXIT WHEN emp_cur%NOTFOUND;

        -- Insert record into backup table
        INSERT INTO EMP_BACKUP
        VALUES (
            v_eid,
            v_name,
            v_deptno2,
            v_deptname,
            v_gender,
            v_age,
            v_basic
        );

        v_count := v_count + 1;
    END LOOP;

    CLOSE emp_cur;

    -- Raise user-defined exception if no records found
    IF v_count = 0 THEN
        RAISE NO_DEPT_FOUND;
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(
            v_count || ' employee record(s) copied to EMP_BACKUP.'
        );
    END IF;

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'NO_DEPT_FOUND: No employees found for Department No. '
            || v_deptno
        );
END;
/