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

