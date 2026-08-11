SET SERVEROUTPUT ON;

DECLARE
    v_eid NUMBER := &EID;
BEGIN
    -- Update basic salary by 10%
    UPDATE EMPLOYEE
    SET BasicSal = BasicSal * 1.10
    WHERE EID = v_eid;

    -- Check whether record exists
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'Employee record updated successfully.'
        );
        DBMS_OUTPUT.PUT_LINE(
            'Number of records updated: ' || SQL%ROWCOUNT
        );
        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'Employee with EID ' || v_eid || ' not found.'
        );
    END IF;
END;
/