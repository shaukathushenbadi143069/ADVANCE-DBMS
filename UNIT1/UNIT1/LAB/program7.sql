SET SERVEROUTPUT ON;

-- Create RESULT table
CREATE TABLE RESULT (
    Rollno NUMBER(5) PRIMARY KEY,
    Name VARCHAR2(30),
    Sub1 NUMBER(5),
    Sub2 NUMBER(5),
    Sub3 NUMBER(5),
    Sub4 NUMBER(5),
    Sub5 NUMBER(5),
    Total NUMBER(5),
    Per NUMBER(5,2),
    Grade VARCHAR2(2)
);

-- Insert student data
INSERT INTO RESULT (Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (101, 'Rahul', 85, 78, 92, 80, 75);

COMMIT;

-- PL/SQL block
DECLARE
    v_rollno RESULT.Rollno%TYPE := &rollno;
    v_total  RESULT.Total%TYPE;
    v_per    RESULT.Per%TYPE;
    v_grade  RESULT.Grade%TYPE;
BEGIN
    -- Calculate Total
    SELECT Sub1 + Sub2 + Sub3 + Sub4 + Sub5
    INTO v_total
    FROM RESULT
    WHERE Rollno = v_rollno;

    -- Calculate Percentage
    v_per := v_total / 5;

    -- Calculate Grade
    IF v_per >= 90 THEN
        v_grade := 'A+';
    ELSIF v_per >= 80 THEN
        v_grade := 'A';
    ELSIF v_per >= 70 THEN
        v_grade := 'B';
    ELSIF v_per >= 60 THEN
        v_grade := 'C';
    ELSIF v_per >= 50 THEN
        v_grade := 'D';
    ELSE
        v_grade := 'F';
    END IF;

    -- Update table
    UPDATE RESULT
    SET Total = v_total,
        Per = v_per,
        Grade = v_grade
    WHERE Rollno = v_rollno;

    COMMIT;

    -- Display result
    DBMS_OUTPUT.PUT_LINE('Roll No    : ' || v_rollno);
    DBMS_OUTPUT.PUT_LINE('Total      : ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage : ' || v_per || '%');
    DBMS_OUTPUT.PUT_LINE('Grade      : ' || v_grade);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Roll No not found.');
END;
/