CREATE VIEW V_DLMU_PartSupp1
AS
SELECT P_NAME,P_PARTKEY,P_RETAILPRICE,PS_SUPPLYCOST,PS_COMMENT,PS_AVAILQTY
FROM PART,PARTSUPP,SUPPLIER
WHERE P_PARTKEY=PS_PARTKEY AND PS_SUPPKEY=S_SUPPKEY AND S_NAME='��������'