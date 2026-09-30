set serveroutput on
declare
product_name char(15);
product_id number(8);
price number:=&price;
begin
select product_name,price INTO product_name,p from product where
proid=id;
dbms_output.put_line('Product name:'||pnm||'
Price:'||p);
EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line('Product id:'||id||' not
available in table');
end;
/