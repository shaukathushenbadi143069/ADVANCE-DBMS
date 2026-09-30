SET SERVEROUTPUT ON;

DECLARE
  
    v_eid   NUMBER(10) := &eid;  
    v_ename   CHAR(20);
    v_deptno  NUMBER(5);
    v_salary  NUMBER(10);          
BEGIN
   
    SELECT ename, deptno, salary
    INTO v_ename, v_deptno, v_salary
    FROM emp
    WHERE eid = v_eid;    

   
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || TRIM(v_ename) || ' | Eid: ' || v_eid || ' | DeptNo: ' || v_deptno || ' | Salary: ' || v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
       
        DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_eid || ' is not available in the table.');
END;
/