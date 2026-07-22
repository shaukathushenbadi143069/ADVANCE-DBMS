SET SERVEROUTPUT ON;

DECLARE
    celsius    NUMBER;
    fahrenheit NUMBER;
BEGIN
    celsius := &Enter_Celsius;

    -- Convert Celsius to Fahrenheit
    fahrenheit := (celsius * 9/5) + 32;

    DBMS_OUTPUT.PUT_LINE('Temperature in Celsius    : ' || celsius || ' °C');
    DBMS_OUTPUT.PUT_LINE('Temperature in Fahrenheit : ' || fahrenheit || ' °F');
END;
/

