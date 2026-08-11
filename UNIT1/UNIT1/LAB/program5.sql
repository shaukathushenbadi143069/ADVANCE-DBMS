DECLARE
    celsius    NUMBER := 25;   -- Enter temperature in Celsius
    fahrenheit NUMBER;
BEGIN
    -- Conversion formula
    fahrenheit := (celsius * 9/5) + 32;

    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Temperature in Celsius  : ' || celsius);
    DBMS_OUTPUT.PUT_LINE('Temperature in Fahrenheit: ' || fahrenheit);
END;
/