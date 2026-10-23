create or replace trigger tri_sunday
before insert or update or delete
On emp
for each row
begin
if trim(To_char(sysdate,'Day'))='Sunday' then
Raise_application_error(-20001,'You cant access
table on Sunday');
end if;

end tri_sunday;
/