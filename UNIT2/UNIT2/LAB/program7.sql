SET SERVEROUTPUT ON;

DECLARE
    -- Declare variables
    v_custid    CUSTOMER.CustID%TYPE;
    v_name      CUSTOMER.Name%TYPE;
    v_city      CUSTOMER.City%TYPE;
    v_mobile    CUSTOMER.Mobile%TYPE;

    -- Explicit cursor
    CURSOR cust_cur IS
        SELECT CustID, Name, City, Mobile
        FROM CUSTOMER;

BEGIN
    -- Open cursor
    OPEN cust_cur;

    LOOP
        -- Fetch record
        FETCH cust_cur
        INTO v_custid, v_name, v_city, v_mobile;

        -- Exit when no more records
        EXIT WHEN cust_cur%NOTFOUND;

        -- Display record
        DBMS_OUTPUT.PUT_LINE(
            'Customer ID: ' || v_custid ||
            ' | Name: ' || v_name ||
            ' | City: ' || v_city ||
            ' | Mobile: ' || v_mobile
        );
    END LOOP;

    -- Close cursor
    CLOSE cust_cur;
END;
/