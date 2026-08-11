
--product,quty,price,discount

set serveroutput on;

declare

productname varchar2(30) :='&productname';
qty number :=&qty;
price number :=&price;
totalbill number;
disc number := &disc;
dis number;
totalamou number;
begin

totalbill := (qty * price);
dis := (totalbill * disc )/100;
totalamou := (totalbill - dis);

dbms_output.put_line(productname);
dbms_output.put_line(qty);
dbms_output.put_line(price);
dbms_output.put_line(disc);
dbms_output.put_line(dis);
dbms_output.put_line(totalamou);
 
end;
/ 
 
   
