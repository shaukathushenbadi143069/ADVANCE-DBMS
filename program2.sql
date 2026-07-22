set serveroutput on
DECLARE
    feet    NUMBER;
    cm      NUMBER;
    inch    NUMBER;
    meter   NUMBER;
BEGIN
    -- Accept input from user
    feet := &Enter_Feet;

    -- Conversion calculations
    inch := feet * 12;
    cm := feet * 30.48;
    meter := feet * 0.3048;

    -- Display results
    DBMS_OUTPUT.PUT_LINE('Measurement in Feet   : ' || feet);
    DBMS_OUTPUT.PUT_LINE('Measurement in Inches : ' || inch);
    DBMS_OUTPUT.PUT_LINE('Measurement in CM     : ' || cm);
    DBMS_OUTPUT.PUT_LINE('Measurement in Meters : ' || meter);
END;
/