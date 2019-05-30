ALTER TABLE PROD
DROP COLUMN PIM_NO_MAIN;

ALTER TABLE PROD
ADD (PIM_MAIN VARCHAR2(100));

select * from prod;

select * from user_constraints order by table_name;