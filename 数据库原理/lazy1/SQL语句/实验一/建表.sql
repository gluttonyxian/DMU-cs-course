CREATE TABLE REGION(
R_REGIONKEY char(10) PRIMARY KEY,
R_NAME char(10),
R_COMMENT char(10)
);
CREATE TABLE NATION(
N_NATIONKEY char(10) PRIMARY KEY,
N_NAME char(10),
N_REGIONKEY char(10),
FOREIGN KEY(N_REGIONKEY) REFERENCES REGION(R_REGIONKEY),
N_COMMENT char(10)
);
CREATE TABLE SUPPLIER(
S_SUPPKEY char(10) PRIMARY KEY,
S_NAME char(10),
S_ADDRESS char(10),
S_NATIONKEY char(10),
FOREIGN KEY(S_NATIONKEY) REFERENCES NATION(N_NATIONKEY),
S_PHONE int,
S_ACCTBAL int,
S_COMMENT char(10)
);
CREATE TABLE PART(
P_PARTKEY char(10) PRIMARY KEY,
P_NAME char(10),
P_MFGR char(10),
P_BRAND char(10),
P_TYPE char(10),
P_SIZE float,
P_CONTAINER char(10),
P_RETAILPRICE float,
P_COMMENT char(10),
);
CREATE TABLE PARTSUPP(
PS_PARTKEY char(10),
FOREIGN KEY(PS_PARTKEY) REFERENCES PART(P_PARTKEY),
PS_SUPPKEY char(10),
FOREIGN KEY(PS_SUPPKEY) REFERENCES SUPPLIER(S_SUPPKEY),
PRIMARY KEY(PS_PARTKEY,PS_SUPPKEY),
PS_AVAILQTY int,
PS_SUPPLYCOST float,
PS_COMMENT char(10)
);
CREATE TABLE CUSTOMER(                                                   
C_CUSTKEY char(10) PRIMARY KEY,
C_NAME char(10),
C_ADDRESS char(10),
C_NATIONKEY char(10),
FOREIGN KEY (C_NATIONKEY) REFERENCES NATION(N_NATIONKEY),
C_PHONE int,
C_ACCTBAL int,
C_MKTSEGMENT char(10),
C_COMMENT char(10),
);
CREATE TABLE ORDERS(
O_ORDERKEY char(10) PRIMARY KEY,
O_CUSTKEY char(10),
FOREIGN KEY(O_CUSTKEY) REFERENCES CUSTOMER(C_CUSTKEY),
O_ORDERSTATUS char(10),
O_TOTALPRICE float,
O_ORDERDATE char(10),
O_ORDER_PRIORITY int,
O_CLERK char(10),
O_SHIP_PRIORITY int,
O_COMMENT char(10)
);
CREATE TABLE LINEITEM(
L_ORDERKEY char(10) ,
FOREIGN KEY (L_ORDERKEY) REFERENCES ORDERS(O_ORDERKEY),
L_PARTKEY char(10),
L_SUPPKEY char(10),
FOREIGN KEY (L_PARTKEY,L_SUPPKEY) REFERENCES PARTSUPP(PS_PARTKEY,PS_SUPPKEY),
L_LINENUMBER int,
PRIMARY KEY(L_ORDERKEY,L_LINENUMBER),
L_QUANTITY int,
L_EXTENDEDPRICE float,
L_DISCOUNT float CHECK(L_DISCOUNT >= 0 AND L_DISCOUNT <= 0.1),
L_TAX float CHECK(L_TAX >= 0 AND L_TAX <= 0.08),
L_RETURNFLAG char(1),
L_LINESTATUS char(1),
L_SHIPDATE date,
L_COMMITDATE date,
L_RECEIPTDATE date,
L_SHIPINSTRUCT char(10),
L_SHIPMODE char(10),
L_COMMENT char(10)
);