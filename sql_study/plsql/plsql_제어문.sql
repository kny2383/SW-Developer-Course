--PL/SQL ���
DECLARE
vempno emp.empno%TYPE;
vename emp.ename%TYPE;
vdeptno emp.deptno%TYPE;
vdname VARCHAR2(20) := null ;
BEGIN
SELECT empno , ename , deptno 
INTO vempno , vename , vdeptno 
FROM emp 
where empno=7900;
IF (vdeptno = 10) THEN -- IF ���� ���۵˴ϴ�.
vdname := 'ACCOUNT';
END IF ; -- IF ���� ������ �ݵ�� END IF �� ���ľ� �մϴ�.
IF (vdeptno = 20) THEN
vdname := 'RESEARCH';
END IF ;
IF (vdeptno = 30) THEN
vdname := 'SALES';
END IF ;
IF (vdeptno = 40) THEN
vdname := 'OPERATIONS';
END IF ;
DBMS_OUTPUT.PUT_LINE (vempno||' '||vename||' '||vdeptno||' '||vdname);
END ;

--IF~THEN~ELSE~END IF
DECLARE
vempno emp.empno%TYPE;
vename emp.ename%TYPE;
vcomm emp.comm%TYPE := NULL;
BEGIN
SELECT empno , ename , comm INTO vempno , vename , vcomm 
FROM emp 
WHERE empno=7900;
IF vcomm > 0 THEN
DBMS_OUTPUT.PUT_LINE (vename||' ����� ���ʽ��� '||vcomm||'�Դϴ�');
ELSE
DBMS_OUTPUT.PUT_LINE (vename||' ����� ���ʽ��� �����ϴ�');
END IF ;
END ;

--basic loop
DECLARE
num number :=0;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE(num);
num := num +1;
      EXIT when num>5;
  END LOOP;
end;

--while
DECLARE
num number :=0;
BEGIN
while num < 6 loop
DBMS_OUTPUT.PUT_LINE(num);
num := num +1;
  END LOOP;
end;

--for
begin
for i in 0..5 loop
    DBMS_OUTOUT.PUT_LINE(i);
   end loop;
end;


