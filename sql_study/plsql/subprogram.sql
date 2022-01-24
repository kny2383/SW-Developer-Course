--procedure

--�μ���ȣ�� 20���� ������� job�� 'CLERK'���� �����ϴ� ���ν���
create or replace procedure update_20
is
begin
  update emp
  set job='CLERK'
  where deptno=20;
end;

execute update_20; 

select * from emp;

--����� �Է� �޾� �޿��� �λ��ϴ� ���ν���
create or replace procedure up_sal
(vempno in emp.empno%type)
is 
begin
  update emp set sal = 5000
  where empno=vempno;
end;
exec up_sal(7902);
select * from emp;

select * from user_source where name='info_prof';

--function �����Լ�
CREATE OR REPLACE FUNCTION s_max_sal
(s_deptno emp.deptno%TYPE)
return number
IS
max_sal emp.sal%TYPE ;
BEGIN
SELECT max(sal) INTO max_sal
FROM emp
WHERE deptno=s_deptno;
RETURN max_sal ; -- �� �κ��� ������ ���� �� 3�� ���� ���� ���ƾ� �մϴ�.
END;
select s_max_sal(10) from dual;

SELECT text
FROM user_source
WHERE type='FUNCTION'
AND name='S_MAX_SAL' ;

--oracle package
--package �����
CREATE OR REPLACE PACKAGE emp_total 
AS
PROCEDURE emp_sum;
PROCEDURE emp_avg;
END emp_total;

--package ��ü��
CREATE OR REPLACE PACKAGE BODY emp_total AS
PROCEDURE emp_sum
IS
CURSOR emp_total_sum IS
SELECT COUNT(*), SUM(NVL(sal,0))
FROM emp;
total_num NUMBER ;
total_sum NUMBER;
BEGIN
OPEN emp_total_sum ;
FETCH emp_total_sum INTO total_num , total_sum ;
DBMS_OUTPUT.PUT_LINE('���ο���: '||total_num||' , �޿��հ�: '||total_sum);
CLOSE emp_total_sum;
END emp_sum ; --emp_sum ���ν��� ��
PROCEDURE emp_avg -- emp_avg ���ν��� ����
IS
CURSOR emp_total_avg IS
SELECT COUNT(*), AVG(NVL(sal,0))
FROM emp;
total_num NUMBER ;
total_avg NUMBER ;
BEGIN
OPEN emp_total_avg ;
FETCH emp_total_avg INTO total_num , total_avg;
DBMS_OUTPUT.PUT_LINE('���ο���: '||total_num||' , �޿����: '||total_avg);
CLOSE emp_total_avg ;
END emp_avg; -- ���ν��� ��
END emp_total; -- ��Ű�� ��

SET SERVEROUTPUT ON
EXEC emp_total.emp_sum; -- ��Ű�� �̸�.���ν��� �̸� ���� �����մϴ�.
SELECT COUNT(*) , SUM(NVL(sal,0)) FROM emp;
EXEC emp_total.emp_avg;

--triger
CREATE TABLE t_order
(no NUMBER,ord_code VARCHAR2(10),ord_date DATE ) ;

CREATE OR REPLACE TRIGGER t_order
BEFORE INSERT ON t_order
BEGIN
IF (TO_CHAR(SYSDATE,'HH24:MI') NOT BETWEEN '15:20' AND '16:50') THEN
RAISE_APPLICATION_ERROR(-20100,'���ð� �ƴմϴ�');
END IF ;
END ;

SELECT SYSDATE FROM DUAL;

INSERT INTO t_order VALUES(1,'C100',SYSDATE);


