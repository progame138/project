
CREATE TABLE ADMIN
(
	ADM_NO               NUMBER NOT NULL ,
	ADM_ID               VARCHAR2(30) NULL ,
	ADM_PWD              VARCHAR2(30) NULL ,
	ADM_NAME             VARCHAR2(30 CHAR) NULL ,
	ADM_BIRTH            DATE NULL ,
	ADM_PHONE            VARCHAR2(30) NULL ,
	ADM_EMAIL            VARCHAR2(50) NULL ,
	ADM_ADDR1            VARCHAR2(100 CHAR) NULL ,
	ADM_ADDR2            VARCHAR2(100 CHAR) NULL ,
	ADM_STATUS           VARCHAR2(10) NULL ,
	ADM_ZIP              VARCHAR2(20) NULL ,
	ADM_SEX              CHAR(1) NULL 
);



CREATE UNIQUE INDEX ADMIN_PK ON ADMIN
(ADM_NO   ASC);



ALTER TABLE ADMIN
	ADD CONSTRAINT  ADMIN_PK PRIMARY KEY (ADM_NO);



CREATE TABLE BLACKLIST
(
	BL_NO                NUMBER NOT NULL ,
	BL_REGS              DATE NOT NULL ,
	BL_EXPR              DATE NOT NULL ,
	BL_REASON            VARCHAR2(30 CHAR) NOT NULL ,
	MEM_NO               NUMBER NOT NULL 
);



CREATE UNIQUE INDEX BLACKLIST_PK ON BLACKLIST
(BL_NO   ASC);



ALTER TABLE BLACKLIST
	ADD CONSTRAINT  BLACKLIST_PK PRIMARY KEY (BL_NO);



CREATE TABLE BRAND
(
	AR_NO                NUMBER NOT NULL ,
	AR_SUBJECT           VARCHAR2(20 CHAR) NOT NULL ,
	AR_CONTENT           VARCHAR2(200 CHAR) NOT NULL ,
	AR_FILE              VARCHAR2(200) NULL 
);



CREATE UNIQUE INDEX BRAND_PK ON BRAND
(AR_NO   ASC);



ALTER TABLE BRAND
	ADD CONSTRAINT  BRAND_PK PRIMARY KEY (AR_NO);



CREATE TABLE CART
(
	PI_NO                NUMBER NOT NULL ,
	CART_QTY             NUMBER NOT NULL ,
	MEM_NO               NUMBER NOT NULL 
);



CREATE UNIQUE INDEX CART_PK ON CART
(MEM_NO   ASC,PI_NO   ASC);



ALTER TABLE CART
	ADD CONSTRAINT  CART_PK PRIMARY KEY (MEM_NO,PI_NO);



CREATE TABLE COLLECTION
(
	CO_NO                NUMBER NOT NULL ,
	CO_NAME              VARCHAR2(20 CHAR) NOT NULL ,
	CO_FEATURE           VARCHAR2(200 CHAR) NOT NULL ,
	CO_FUNCTION          VARCHAR2(200 CHAR) NULL ,
	CO_YEAR              NUMBER(4) NOT NULL 
);



CREATE UNIQUE INDEX COLLECTION_PK ON COLLECTION
(CO_NO   ASC);



ALTER TABLE COLLECTION
	ADD CONSTRAINT  COLLECTION_PK PRIMARY KEY (CO_NO);



CREATE TABLE COUPON
(
	CP_NO                NUMBER NOT NULL ,
	CP_TITLE             VARCHAR2(30 CHAR) NOT NULL ,
	CP_CONTENT           VARCHAR2(100 CHAR) NULL ,
	CP_DISCOUNT          NUMBER NOT NULL ,
	CP_DATE              DATE NOT NULL ,
	CP_EDATE             DATE NULL ,
	EV_NO                NUMBER NOT NULL 
);



CREATE UNIQUE INDEX COUPON_PK ON COUPON
(CP_NO   ASC);



ALTER TABLE COUPON
	ADD CONSTRAINT  COUPON_PK PRIMARY KEY (CP_NO);



CREATE TABLE COUPON_INS
(
	CI_NO                NUMBER NOT NULL ,
	CI_USE               VARCHAR2(3) NOT NULL ,
	CP_NO                NUMBER NOT NULL ,
	MEM_NO               NUMBER NOT NULL 
);



CREATE UNIQUE INDEX COUPON_INS_PK ON COUPON_INS
(CI_NO   ASC);



ALTER TABLE COUPON_INS
	ADD CONSTRAINT  COUPON_INS_PK PRIMARY KEY (CI_NO);



CREATE TABLE DELIVERY
(
	DM_NO                NUMBER NOT NULL ,
	OD_NO                NUMBER NOT NULL ,
	DM_NAME              VARCHAR2(30 CHAR) NOT NULL ,
	DM_NUMBER            VARCHAR2(30) NOT NULL ,
	DM_STATUS            VARCHAR2(20 CHAR) NOT NULL 
);



CREATE UNIQUE INDEX DELIVERY_PK ON DELIVERY
(DM_NO   ASC);



ALTER TABLE DELIVERY
	ADD CONSTRAINT  DELIVERY_PK PRIMARY KEY (DM_NO);



CREATE TABLE EVENT
(
	EV_NO                NUMBER NOT NULL ,
	EV_TITLE             VARCHAR2(30 CHAR) NOT NULL ,
	EV_CONTENT           VARCHAR2(1000 CHAR) NULL ,
	EV_IMG               VARCHAR2(200) NULL ,
	EV_DATE              DATE NOT NULL ,
	EV_EDATE             DATE NULL 
);



CREATE UNIQUE INDEX EVENT_PK ON EVENT
(EV_NO   ASC);



ALTER TABLE EVENT
	ADD CONSTRAINT  EVENT_PK PRIMARY KEY (EV_NO);



CREATE TABLE FAQ
(
	FAQ_NO               NUMBER NOT NULL ,
	FAQ_TITLE            VARCHAR2(200 CHAR) NOT NULL ,
	FAQ_CONTENT          VARCHAR2(1000 CHAR) NOT NULL ,
	FAQ_DATE             DATE DEFAULT  SYSDATE  NOT NULL ,
	FC_NO                NUMBER NOT NULL 
);



CREATE UNIQUE INDEX FAQ_PK ON FAQ
(FAQ_NO   ASC);



ALTER TABLE FAQ
	ADD CONSTRAINT  FAQ_PK PRIMARY KEY (FAQ_NO);



CREATE TABLE FAQ_CTG
(
	FC_NO                NUMBER NOT NULL ,
	FC_NAME              VARCHAR2(10 CHAR) NOT NULL 
);



CREATE UNIQUE INDEX FAQ_CTG ON FAQ_CTG
(FC_NO   ASC);



ALTER TABLE FAQ_CTG
	ADD CONSTRAINT  FAQ_CTG PRIMARY KEY (FC_NO);



CREATE TABLE GRADE
(
	CLS_NO               NUMBER NOT NULL ,
	CLS_NAME             VARCHAR2(30 CHAR) NOT NULL ,
	CLS_REQ              NUMBER NOT NULL ,
	CLS_ACC              NUMBER NOT NULL ,
	CLS_DC               NUMBER NOT NULL 
);



CREATE UNIQUE INDEX GRADE_PK ON GRADE
(CLS_NO   ASC);



ALTER TABLE GRADE
	ADD CONSTRAINT  GRADE_PK PRIMARY KEY (CLS_NO);



CREATE TABLE MEMBER
(
	MEM_NO               NUMBER NOT NULL ,
	MEM_ID               VARCHAR2(30) NULL ,
	MEM_PWD              VARCHAR2(30) NULL ,
	MEM_NAME             VARCHAR2(30 CHAR) NULL ,
	MEM_BIRTH            DATE NULL ,
	MEM_SEX              CHAR(1) NULL ,
	MEM_ADDR1            VARCHAR2(100 CHAR) NULL ,
	MEM_ADDR2            VARCHAR2(100 CHAR) NULL ,
	MEM_PHONE            VARCHAR2(30) NULL ,
	MEM_EMAIL            VARCHAR2(50) NULL ,
	CLS_NO               NUMBER NULL ,
	MEM_ZIP              VARCHAR2(20) NULL 
);



CREATE UNIQUE INDEX MEMBER_PK ON MEMBER
(MEM_NO   ASC);



ALTER TABLE MEMBER
	ADD CONSTRAINT  MEMBER_PK PRIMARY KEY (MEM_NO);



CREATE TABLE NOTICE
(
	NO_NO                NUMBER NOT NULL ,
	NO_KIND              VARCHAR2(20 CHAR) NOT NULL ,
	NO_SUBJECT           VARCHAR2(30 CHAR) NOT NULL ,
	NO_CONTENT           VARCHAR2(200 CHAR) NOT NULL ,
	ADM_NO               NUMBER NOT NULL ,
	NO_DATE              DATE DEFAULT  SYSDATE  NOT NULL 
);



CREATE UNIQUE INDEX NOTICE_PK ON NOTICE
(NO_NO   ASC);



ALTER TABLE NOTICE
	ADD CONSTRAINT  NOTICE_PK PRIMARY KEY (NO_NO);



CREATE TABLE NOTICE_REPLY
(
	RE_NO                NUMBER NOT NULL ,
	MEM_NO               NUMBER NOT NULL ,
	RE_CONTENT           VARCHAR2(200 CHAR) NOT NULL ,
	RE_DATE              DATE DEFAULT  SYSDATE  NOT NULL ,
	NO_NO                NUMBER NOT NULL 
);



CREATE UNIQUE INDEX NOTICE_REPLY_PK ON NOTICE_REPLY
(RE_NO   ASC);



ALTER TABLE NOTICE_REPLY
	ADD CONSTRAINT  NOTICE_REPLY_PK PRIMARY KEY (RE_NO);



CREATE TABLE ORDERS
(
	OD_NO                NUMBER NOT NULL ,
	MEM_NO               NUMBER NOT NULL ,
	OD_DATE              DATE DEFAULT  SYSDATE  NOT NULL ,
	OD_PROG              CHAR(1) NOT NULL 
);



CREATE UNIQUE INDEX ORDERS_PK ON ORDERS
(OD_NO   ASC);



ALTER TABLE ORDERS
	ADD CONSTRAINT  ORDERS_PK PRIMARY KEY (OD_NO);



CREATE TABLE ORDERS_INS
(
	OD_NO                NUMBER NOT NULL ,
	PI_NO                NUMBER NOT NULL ,
	OI_QTY               NUMBER NOT NULL ,
	OI_PURCHASE          NUMBER NOT NULL ,
	OI_PRICE             NUMBER NOT NULL ,
	CP_NO                NUMBER NULL ,
	RD_NO                NUMBER NULL 
);



CREATE UNIQUE INDEX ORDERS_INS_PK ON ORDERS_INS
(OD_NO   ASC,PI_NO   ASC);



ALTER TABLE ORDERS_INS
	ADD CONSTRAINT  ORDERS_INS_PK PRIMARY KEY (OD_NO,PI_NO);



CREATE TABLE ORDERS_STATUS
(
	OD_NO                NUMBER NOT NULL ,
	PI_NO                NUMBER NOT NULL ,
	OS_NO                NUMBER NOT NULL ,
	OS_QTY               NUMBER NOT NULL ,
	OS_STATUS            VARCHAR2(20 CHAR) NOT NULL ,
	OS_DATE              DATE DEFAULT  SYSDATE  NOT NULL 
);



CREATE UNIQUE INDEX ORDER_STATUS_PK ON ORDERS_STATUS
(OS_NO   ASC);



ALTER TABLE ORDERS_STATUS
	ADD CONSTRAINT  ORDER_STATUS_PK PRIMARY KEY (OS_NO);



CREATE TABLE PROD
(
	PD_NO                NUMBER NOT NULL ,
	PD_NAME              VARCHAR2(100 CHAR) NOT NULL ,
	PD_SEX               CHAR(1) NOT NULL ,
	PD_AGE               CHAR(1) NOT NULL ,
	PCT_NO               NUMBER NULL ,
	CO_NO                NUMBER NULL ,
	PD_PRICE             NUMBER NOT NULL ,
	PD_FABRIC            VARCHAR2(100 CHAR) NOT NULL ,
	PD_COUNTRY           VARCHAR2(20 CHAR) NOT NULL ,
	PD_YEAR              VARCHAR2(7) NOT NULL ,
	PD_MANU              VARCHAR2(20 CHAR) NOT NULL ,
	PD_IMPORT            VARCHAR2(20 CHAR) NOT NULL ,
	PI_NO                NUMBER NULL ,
	PD_DATE              DATE DEFAULT  SYSDATE  NOT NULL ,
	PD_STATUS            CHAR(1) NULL ,
	PIM_NO_MAIN          NUMBER NULL 
);



CREATE UNIQUE INDEX PROD_PK ON PROD
(PD_NO   ASC);



ALTER TABLE PROD
	ADD CONSTRAINT  PROD_PK PRIMARY KEY (PD_NO);



CREATE TABLE PROD_COLOR
(
	PCL_NAME             VARCHAR2(20 CHAR) NOT NULL ,
	PCL_CODE             CHAR(6) NOT NULL ,
	PCL_NO               NUMBER NOT NULL 
);



CREATE UNIQUE INDEX PROD_COLOR_PK ON PROD_COLOR
(PCL_NO   ASC);



ALTER TABLE PROD_COLOR
	ADD CONSTRAINT  PROD_COLOR_PK PRIMARY KEY (PCL_NO);



ALTER TABLE PROD_COLOR
ADD CONSTRAINT  PCL_CODE_UQ UNIQUE (PCL_CODE);



ALTER TABLE PROD_COLOR
ADD CONSTRAINT  PCL_NAME_UQ UNIQUE (PCL_NAME);



CREATE TABLE PROD_CTG
(
	PCT_NO               NUMBER NOT NULL ,
	PCT_NAME             VARCHAR2(20 CHAR) NOT NULL 
);



CREATE UNIQUE INDEX PROD_CTG_PK ON PROD_CTG
(PCT_NO   ASC);



ALTER TABLE PROD_CTG
	ADD CONSTRAINT  PROD_CTG_PK PRIMARY KEY (PCT_NO);



CREATE TABLE PROD_IMAGE
(
	PIM_NO               NUMBER NOT NULL ,
	PI_NO                NUMBER NOT NULL ,
	PIM_USE              CHAR(1) NOT NULL ,
	PIM_FILE             VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX PROD_IMAGE_PK ON PROD_IMAGE
(PIM_NO   ASC);



ALTER TABLE PROD_IMAGE
	ADD CONSTRAINT  PROD_IMAGE_PK PRIMARY KEY (PIM_NO);



CREATE TABLE PROD_INS
(
	PI_NO                NUMBER NOT NULL ,
	PD_NO                NUMBER NOT NULL ,
	PI_SIZE              NUMBER(3) NOT NULL ,
	PI_QTY               NUMBER NOT NULL ,
	PI_STATUS            CHAR(1) NULL ,
	PCL_NO               NUMBER NOT NULL ,
);



CREATE UNIQUE INDEX PROD_INS_PK ON PROD_INS
(PI_NO   ASC);



ALTER TABLE PROD_INS
	ADD CONSTRAINT  PROD_INS_PK PRIMARY KEY (PI_NO);



ALTER TABLE PROD_INS
ADD CONSTRAINT  PROD_INS_UQ UNIQUE (PD_NO,PI_SIZE,PCL_NO);



CREATE TABLE PROD_WARE
(
	PW_NO                NUMBER NOT NULL ,
	PI_NO                NUMBER NOT NULL ,
	PW_QTY               NUMBER NOT NULL ,
	ADM_NO               NUMBER NOT NULL ,
	PW_DATE              DATE DEFAULT  SYSDATE  NOT NULL ,
	PW_PURCHASE          NUMBER NOT NULL 
);



CREATE UNIQUE INDEX PROD_WARE_PK ON PROD_WARE
(PW_NO   ASC);



ALTER TABLE PROD_WARE
	ADD CONSTRAINT  PROD_WARE_PK PRIMARY KEY (PW_NO);



CREATE TABLE PROVISION
(
	P_NO                 NUMBER NOT NULL ,
	P_TITLE              VARCHAR2(100 CHAR) NOT NULL ,
	P_CONTENT            CLOB NOT NULL ,
	P_DATE               DATE DEFAULT  SYSDATE  NOT NULL 
);



CREATE UNIQUE INDEX PROVISION_PK ON PROVISION
(P_NO   ASC);



ALTER TABLE PROVISION
	ADD CONSTRAINT  PROVISION_PK PRIMARY KEY (P_NO);



CREATE TABLE QNA
(
	QNA_NO               NUMBER NOT NULL ,
	MEM_NO               NUMBER NOT NULL ,
	OD_NO                NUMBER NOT NULL ,
	QNA_TITLE            VARCHAR2(100 CHAR) NOT NULL ,
	QNA_CONTENT          VARCHAR2(1000 CHAR) NOT NULL ,
	QNA_FILE             VARCHAR2(100 CHAR) NULL ,
	QNA_DATE             DATE DEFAULT  SYSDATE  NOT NULL ,
	QNA_CTGR             VARCHAR2(30) NOT NULL 
);



CREATE UNIQUE INDEX QNA_PK ON QNA
(QNA_NO   ASC);



ALTER TABLE QNA
	ADD CONSTRAINT  QNA_PK PRIMARY KEY (QNA_NO);



CREATE TABLE QNA_REPLY
(
	QR_NO                NUMBER NOT NULL ,
	QNA_NO               NUMBER NOT NULL ,
	QR_TITLE             VARCHAR2(100 CHAR) NOT NULL ,
	QR_CONTENT           VARCHAR2(1000 CHAR) NOT NULL ,
	QR_FILE              VARCHAR2(100 CHAR) NULL ,
	QR_DATE              DATE DEFAULT  SYSDATE  NOT NULL ,
	ADM_NO               NUMBER NULL ,
	MEM_NO               NUMBER NULL 
);



CREATE UNIQUE INDEX QNA_REPLY_PK ON QNA_REPLY
(QR_NO   ASC);



ALTER TABLE QNA_REPLY
	ADD CONSTRAINT  QNA_REPLY_PK PRIMARY KEY (QR_NO);



CREATE TABLE RANGE_DISCOUNT
(
	RD_NO                NUMBER NOT NULL ,
	RD_CONTENT           VARCHAR2(100 CHAR) NULL ,
	RD_DISCOUNT          NUMBER NOT NULL ,
	EV_NO                NUMBER NOT NULL ,
	RD_TITLE             VARCHAR2(30 CHAR) NOT NULL 
);



CREATE UNIQUE INDEX RANGE_DISCOUNT_PK ON RANGE_DISCOUNT
(RD_NO   ASC);



ALTER TABLE RANGE_DISCOUNT
	ADD CONSTRAINT  RANGE_DISCOUNT_PK PRIMARY KEY (RD_NO);



CREATE TABLE RATING
(
	RT_NO                NUMBER NOT NULL ,
	PI_NO                NUMBER NOT NULL ,
	RT_SCORE             NUMBER(2) NOT NULL ,
	RT_SIZE              CHAR(1) NOT NULL ,
	RT_COLOR             CHAR(1) NOT NULL ,
	RT_DATE              DATE DEFAULT  SYSDATE  NOT NULL ,
	RT_TITLE             VARCHAR2(100 CHAR) NOT NULL ,
	RT_CONTENT           VARCHAR2(1000 CHAR) NOT NULL ,
	MEM_NO               NUMBER NOT NULL 
);



CREATE UNIQUE INDEX RATING_PK ON RATING
(RT_NO   ASC);



ALTER TABLE RATING
	ADD CONSTRAINT  RATING_PK PRIMARY KEY (RT_NO);



CREATE TABLE RATING_IMAGE
(
	RIM_NO               NUMBER NOT NULL ,
	RT_NO                NUMBER NOT NULL ,
	RIM_FILE             VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX RATING_IMAGE_PK ON RATING_IMAGE
(RIM_NO   ASC);



ALTER TABLE RATING_IMAGE
	ADD CONSTRAINT  RATING_IMAGE_PK PRIMARY KEY (RIM_NO);



CREATE TABLE RATING_VOTE
(
	RT_NO                NUMBER NOT NULL ,
	MEM_NO               NUMBER NOT NULL 
);



CREATE UNIQUE INDEX RATING_VOTE_PK ON RATING_VOTE
(RT_NO   ASC,MEM_NO   ASC);



ALTER TABLE RATING_VOTE
	ADD CONSTRAINT  RATING_VOTE_PK PRIMARY KEY (RT_NO,MEM_NO);



CREATE TABLE RD_PRODUCT
(
	RD_NO                NUMBER NOT NULL ,
	PD_NO                NUMBER NOT NULL 
);



CREATE UNIQUE INDEX RD_PRODUCT_PK ON RD_PRODUCT
(RD_NO   ASC,PD_NO   ASC);



ALTER TABLE RD_PRODUCT
	ADD CONSTRAINT  RD_PRODUCT_PK PRIMARY KEY (RD_NO,PD_NO);



CREATE TABLE RD_TYPE
(
	RD_NO                NUMBER NOT NULL ,
	PCT_NO               NUMBER NOT NULL 
);



CREATE UNIQUE INDEX RD_TYPE_PK ON RD_TYPE
(RD_NO   ASC,PCT_NO   ASC);



ALTER TABLE RD_TYPE
	ADD CONSTRAINT  RD_TYPE_PK PRIMARY KEY (RD_NO,PCT_NO);



CREATE TABLE SECEDE
(
	MEM_NO               NUMBER NOT NULL ,
	SC_REASON            VARCHAR2(100 CHAR) NOT NULL ,
	SC_DATE              DATE NOT NULL ,
	SC_DUE               DATE NOT NULL 
);



CREATE UNIQUE INDEX SECEDE_PK ON SECEDE
(MEM_NO   ASC);



ALTER TABLE SECEDE
	ADD CONSTRAINT  SECEDE_PK PRIMARY KEY (MEM_NO);



ALTER TABLE BLACKLIST
	ADD (CONSTRAINT R_11 FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO));



ALTER TABLE CART
	ADD (CONSTRAINT R_45 FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO));



ALTER TABLE CART
	ADD (CONSTRAINT R_46 FOREIGN KEY (PI_NO) REFERENCES PROD_INS (PI_NO));



ALTER TABLE COUPON
	ADD (CONSTRAINT R_6 FOREIGN KEY (EV_NO) REFERENCES EVENT (EV_NO));



ALTER TABLE COUPON_INS
	ADD (CONSTRAINT R_7 FOREIGN KEY (CP_NO) REFERENCES COUPON (CP_NO));



ALTER TABLE COUPON_INS
	ADD (CONSTRAINT R_13 FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO));



ALTER TABLE DELIVERY
	ADD (CONSTRAINT R_32 FOREIGN KEY (OD_NO) REFERENCES ORDERS (OD_NO));



ALTER TABLE FAQ
	ADD (CONSTRAINT R_3 FOREIGN KEY (FC_NO) REFERENCES FAQ_CTG (FC_NO));



ALTER TABLE MEMBER
	ADD (CONSTRAINT R_9 FOREIGN KEY (CLS_NO) REFERENCES GRADE (CLS_NO));



ALTER TABLE NOTICE
	ADD (CONSTRAINT R_34 FOREIGN KEY (ADM_NO) REFERENCES ADMIN (ADM_NO));



ALTER TABLE NOTICE_REPLY
	ADD (CONSTRAINT R_35 FOREIGN KEY (NO_NO) REFERENCES NOTICE (NO_NO));



ALTER TABLE NOTICE_REPLY
	ADD (CONSTRAINT R_36 FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO));



ALTER TABLE ORDERS
	ADD (CONSTRAINT R_27 FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO));



ALTER TABLE ORDERS_INS
	ADD (CONSTRAINT R_26 FOREIGN KEY (OD_NO) REFERENCES ORDERS (OD_NO));



ALTER TABLE ORDERS_INS
	ADD (CONSTRAINT R_30 FOREIGN KEY (PI_NO) REFERENCES PROD_INS (PI_NO));



ALTER TABLE ORDERS_INS
	ADD (CONSTRAINT R_51 FOREIGN KEY (CP_NO) REFERENCES COUPON (CP_NO));



ALTER TABLE ORDERS_INS
	ADD (CONSTRAINT R_52 FOREIGN KEY (RD_NO) REFERENCES RANGE_DISCOUNT (RD_NO));



ALTER TABLE ORDERS_STATUS
	ADD (CONSTRAINT R_25 FOREIGN KEY (OD_NO, PI_NO) REFERENCES ORDERS_INS (OD_NO, PI_NO));



ALTER TABLE PROD
	ADD (CONSTRAINT R_37 FOREIGN KEY (CO_NO) REFERENCES COLLECTION (CO_NO));



ALTER TABLE PROD
	ADD (CONSTRAINT R_38 FOREIGN KEY (PCT_NO) REFERENCES PROD_CTG (PCT_NO));



ALTER TABLE PROD
	ADD (CONSTRAINT R_48 FOREIGN KEY (PI_NO) REFERENCES PROD_INS (PI_NO));



ALTER TABLE PROD
	ADD (CONSTRAINT R_56 FOREIGN KEY (PIM_NO_MAIN) REFERENCES PROD_IMAGE (PIM_NO));



ALTER TABLE PROD_IMAGE
	ADD (CONSTRAINT R_19 FOREIGN KEY (PI_NO) REFERENCES PROD_INS (PI_NO));



ALTER TABLE PROD_INS
	ADD (CONSTRAINT R_17 FOREIGN KEY (PD_NO) REFERENCES PROD (PD_NO));



ALTER TABLE PROD_INS
	ADD (CONSTRAINT R_18 FOREIGN KEY (PCL_NO) REFERENCES PROD_COLOR (PCL_NO));




ALTER TABLE PROD_WARE
	ADD (CONSTRAINT R_53 FOREIGN KEY (PI_NO) REFERENCES PROD_INS (PI_NO));



ALTER TABLE PROD_WARE
	ADD (CONSTRAINT R_54 FOREIGN KEY (ADM_NO) REFERENCES ADMIN (ADM_NO));



ALTER TABLE QNA
	ADD (CONSTRAINT R_28 FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO));



ALTER TABLE QNA
	ADD (CONSTRAINT R_31 FOREIGN KEY (OD_NO) REFERENCES ORDERS (OD_NO));



ALTER TABLE QNA_REPLY
	ADD (CONSTRAINT R_4 FOREIGN KEY (QNA_NO) REFERENCES QNA (QNA_NO));



ALTER TABLE QNA_REPLY
	ADD (CONSTRAINT R_14 FOREIGN KEY (ADM_NO) REFERENCES ADMIN (ADM_NO));



ALTER TABLE QNA_REPLY
	ADD (CONSTRAINT R_15 FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO));



ALTER TABLE RANGE_DISCOUNT
	ADD (CONSTRAINT R_8 FOREIGN KEY (EV_NO) REFERENCES EVENT (EV_NO));



ALTER TABLE RATING
	ADD (CONSTRAINT R_16 FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO));



ALTER TABLE RATING
	ADD (CONSTRAINT R_23 FOREIGN KEY (PI_NO) REFERENCES PROD_INS (PI_NO));



ALTER TABLE RATING_IMAGE
	ADD (CONSTRAINT R_20 FOREIGN KEY (RT_NO) REFERENCES RATING (RT_NO));



ALTER TABLE RATING_VOTE
	ADD (CONSTRAINT R_22 FOREIGN KEY (RT_NO) REFERENCES RATING (RT_NO));



ALTER TABLE RATING_VOTE
	ADD (CONSTRAINT R_55 FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO));



ALTER TABLE RD_PRODUCT
	ADD (CONSTRAINT R_39 FOREIGN KEY (RD_NO) REFERENCES RANGE_DISCOUNT (RD_NO));



ALTER TABLE RD_PRODUCT
	ADD (CONSTRAINT R_40 FOREIGN KEY (PD_NO) REFERENCES PROD (PD_NO));



ALTER TABLE RD_TYPE
	ADD (CONSTRAINT R_41 FOREIGN KEY (PCT_NO) REFERENCES PROD_CTG (PCT_NO));



ALTER TABLE RD_TYPE
	ADD (CONSTRAINT R_42 FOREIGN KEY (RD_NO) REFERENCES RANGE_DISCOUNT (RD_NO));



ALTER TABLE SECEDE
	ADD (CONSTRAINT R_12 FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO));


