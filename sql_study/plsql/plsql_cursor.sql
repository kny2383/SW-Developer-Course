--PL/SQL Cursor

declare
wempno number(4);
vename varchar2(20);
vsal number(7);

cursor c1 is
select empno,ename,sal from emp where deptno=20;

begin
  open c1;
  dbms_output.put_line('��ȣ   �̸�   �޿�');
  
  loop
    fetch c1 into vempno, vename, vsal;
    exit when c1%notfound;
    
    dbms_output.put_line(vempno||' '||vename||' '||vsal);
end loop;
close c1;
end;

select * from emp;

DECLARE
CURSOR emp_cur IS -- Ŀ�� ����˴ϴ�
SELECT empno ,ename
FROM emp;
BEGIN
FOR emp_rec IN emp_cur -- Ŀ���� �����͸� ������ emp_rec ���� �����
LOOP
DBMS_OUTPUT.PUT_LINE(emp_rec.empno||' '||emp_rec.ename);
END LOOP;
END;



