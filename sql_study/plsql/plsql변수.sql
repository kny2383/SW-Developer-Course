--PL/SQL ����
select * from emp3;
desc emp3;
create table emp3 as select empno,ename,sal from emp;
set serveroutput on;
DECLARE
v_row emp3%rowtype;
begin 
select * into v_row
from emp3
where empno=7900;
DBMS_OUTPUT.PUT_LINE(v_row.empno||'**'||v_row.ename||'**'||v_row.sal);
end;

--rowtype ����
CREATE TABLE row_test
( no NUMBER, name VARCHAR2(10),hdate DATE );
CREATE TABLE row_test2
AS SELECT * FROM row_test;
INSERT INTO row_test VALUES (1,'AAA',SYSDATE);
INSERT INTO row_test VALUES (2,'BBB',SYSDATE);
INSERT INTO row_test VALUES (3,'CCC',SYSDATE);
commit;

DECLARE
v_record row_test%ROWTYPE ;
BEGIN
SELECT * INTO v_record
FROM row_test
WHERE no=1 ;
insert into row_test2 VALUES v_record ;
END;

--���ε� ����
BEGIN
SELECT (pay*12)+NVL(bonus,0) INTO :v_bind
FROM professor
WHERE profno=1001 ;
END;
--PL/SQL ����
select * from emp3;
desc emp3;
create table emp3 as select empno,ename,sal from emp;
set serveroutput on;
DECLARE
v_row emp3%rowtype;
begin 
select * into v_row
from emp3
where empno=7900;
DBMS_OUTPUT.PUT_LINE(v_row.empno||'**'||v_row.ename||'**'||v_row.sal);
end;

--rowtype ����
CREATE TABLE row_test
( no NUMBER, name VARCHAR2(10),hdate DATE );
CREATE TABLE row_test2
AS SELECT * FROM row_test;
INSERT INTO row_test VALUES (1,'AAA',SYSDATE);
INSERT INTO row_test VALUES (2,'BBB',SYSDATE);
INSERT INTO row_test VALUES (3,'CCC',SYSDATE);
commit;

DECLARE
v_record row_test%ROWTYPE ;
BEGIN
SELECT * INTO v_record
FROM row_test
WHERE no=1 ;
insert into row_test2 VALUES v_record ;
END;

--���ε� ���� (sqlplus���� �����ϸ� ��)
set autoprint on; --print ���� ���ŷοﶧ
variable v_bind;
BEGIN
SELECT (pay*12)+NVL(bonus,0) INTO :v_bind
FROM professor
WHERE profno=1001 ;
END;

print v_bind;

