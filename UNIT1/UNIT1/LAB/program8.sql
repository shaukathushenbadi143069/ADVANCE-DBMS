SET SERVEROUTPUT ON;

-- Create EMP table
CREATE TABLE EMP (
    EID NUMBER(5) PRIMARY KEY,
    EName VARCHAR2(30),
    Deptno NUMBER(5),
    Deptname VARCHAR2(30),
    Gender VARCHAR2(10),
    Age NUMBER(3),
    BasicSal NUMBER(10,2)
);

-- Insert sample employee data
INSERT INTO EMP
VALUES (101, 'Rahul', 10, 'IT', 'Male', 25, 30000);

INSERT INTO EMP
VALUES (102, 'Priya', 20, 'HR', 'Female', 28, 40000);

INSERT INTO EMP
VALUES (103, 'Amit', 30, 'Sales', 'Male', 30, 25000);

COMMIT;

-- PL/SQL block
DECLARE
    v_eid       EMP.EID%TYPE := &EID;
    v_name      EMP.EName%TYPE;
    v_basic     EMP.BasicSal%TYPE;
    v_hra       NUMBER;
    v_da        NUMBER;
    v_medical   NUMBER;
    v_pf        NUMBER;
    v_gross     NUMBER;
BEGIN
    -- Get employee details
    SELECT EName, BasicSal
    INTO v_name, v_basic
    FROM EMP
    WHERE EID = v_eid;

    -- Calculate HRA, DA, Medical and PF
    v_hra     := v_basic * 15 / 100;
    v_da      := v_basic * 50 / 100;
    v_medical := 500;
    v_pf      := v_basic * 10 / 100;

    -- Calculate Gross Salary
    v_gross := v_basic + (v_da + v_hra + v_medical) - v_pf;

    -- Display result
    DBMS_OUTPUT.PUT_LINE('Employee ID     : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('Employee Name   : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary    : Rs. ' || v_basic);
    DBMS_OUTPUT.PUT_LINE('HRA (15%)       : Rs. ' || v_hra);
    DBMS_OUTPUT.PUT_LINE('DA (50%)        : Rs. ' || v_da);
    DBMS_OUTPUT.PUT_LINE('Medical         : Rs. ' || v_medical);
    DBMS_OUTPUT.PUT_LINE('PF (10%)        : Rs. ' || v_pf);
    DBMS_OUTPUT.PUT_LINE('Gross Salary    : Rs. ' || v_gross);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee with EID ' || v_eid || ' not found.');
END;
/