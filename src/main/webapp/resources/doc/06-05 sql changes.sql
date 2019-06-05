alter table prod_stock
rename column PI_SIZE to PS_SIZE;
alter table prod_stock
rename column PI_QTY to PS_QTY;
alter table prod_stock
rename column PI_STATUS to PS_STATUS;

alter table prod_stock
drop constraint prod_stock_pk;
alter table prod_stock
drop constraint prod_stock_uq;
alter table prod_stock
drop column PS_NO;
alter table prod_stock
add constraint prod_stock_pk primary key(PI_NO, PS_SIZE);