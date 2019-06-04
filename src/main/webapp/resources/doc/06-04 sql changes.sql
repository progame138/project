ALTER TABLE qna_reply
DROP COLUMN qr_file;

alter table qna
drop column qna_file;

alter table qna modify od_no number null;

ALTER TABLE MEMBER ADD (MEM_ADDR3  VARCHAR2(100));

create sequence MEMBER_seq
start with 1
increment by 1
minvalue 1
cache 2;


alter table prod_ins
drop constraint PROD_INS_UQ;
ALTER TABLE PROD_INS
ADD CONSTRAINT  PROD_INS_UQ UNIQUE (PD_NO,PCL_NO);
alter table prod_ins
drop column pi_qty;
alter table prod_ins
drop column pi_size;
alter table prod_ins
drop column pi_status;

CREATE TABLE PROD_STOCK
(
	PS_NO                NUMBER NOT NULL ,
	PI_NO                NUMBER NOT NULL ,
	PI_SIZE              NUMBER(3) NOT NULL ,
	PI_QTY               NUMBER NOT NULL ,
	PI_STATUS            CHAR(1) NULL,
    
    CONSTRAINT PROD_STOCK_PK PRIMARY KEY(PS_NO),
    CONSTRAINT PROD_STOCK_UQ UNIQUE(PI_NO, PI_SIZE)
);