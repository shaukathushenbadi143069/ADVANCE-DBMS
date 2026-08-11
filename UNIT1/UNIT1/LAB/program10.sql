SET SERVEROUTPUT ON;

DECLARE
    v_eid EMP.EID%TYPE := &EID;
BEGIN
    DELETE FROM EMP
    WHERE EID = v_eid;

    IF SQL%ROWCOUNT > 0 THEN
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Employee record deleted successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee with EID ' || v_eid || ' not found.');
    END IF;
END;
/