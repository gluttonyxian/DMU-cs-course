/*利用一个表中的数据来判断是否修改另外一个表中的数*/
UPDATE LINEITEM SET L_DISCOUNT=0.88
WHERE L_PARTKEY=111 AND L_ORDERKEY
IN(
SELECT O_ORDERKEY FROM ORDERS
WHERE O_CUSTKEY IN
(
SELECT C_CUSTKEY FROM CUSTOMER
WHERE C_NAME='张三'
)
)