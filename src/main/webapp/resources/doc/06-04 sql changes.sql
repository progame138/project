ALTER TABLE qna_reply
DROP COLUMN qr_file;

alter table qna
drop column qna_file;

alter table qna modify od_no number null;

ALTER TABLE MEMBER ADD (MEM_ADDR3  VARCHAR2(100));