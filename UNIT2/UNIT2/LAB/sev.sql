SET SERVEROUTPUT ON;

DECLARE
    -- Explicit cursor
    CURSOR c_customer IS
        SELECT customer_id, customer_name, city
        FROM customer;

    v_id   CUSTOMER.customer_id%TYPE;
    v_name CUSTOMER.customer_name%TYPE;
    v_city CUSTOMER.city%TYPE;

BEGIN
    OPEN c_customer;

    LOOP
        FETCH c_customer INTO v_id, v_name, v_city;

        EXIT WHEN c_customer%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Customer ID   : ' || v_id);
        DBMS_OUTPUT.PUT_LINE('Customer Name : ' || v_name);
        DBMS_OUTPUT.PUT_LINE('City          : ' || v_city);
        DBMS_OUTPUT.PUT_LINE('---------------------------');
    END LOOP;

    CLOSE c_customer;
END;
/