select * from tab;

desc student;

select studno,name from student;

select studno "�й�", name AS "�̸�", profno ����������ȣ from student;

select empno "�����ȣ", ename "�����", job "����" from emp;

select distinct deptno1 from student;

select name, position from professor;
select name || position from professor;

select name || '����' || position || '�Դϴ�' from professor;

select * from student;

select name || '�� Ű�� ' || height || 'cm,' || ' �����Դ� '|| weight || 'kg �Դϴ�' from student;

select ename, sal, sal+100 from emp;

select ename, sal, sal*110/100 from emp;

select sal, sal+100/2, (sal+100)/2 from emp;

select ename, sal, deptno from emp where sal > 4000;

select ename, empno, sal from emp where ename = 'scott';

select * from emp;

select ename, empno, sal from emp where ename = 'SCOTT'; --�̸��� ��ҹ��� �����ؾ���.

select name, pay, hiredate from professor where hiredate = '23-MAY-01';

select * from professor;

desc professor;

select name, height from student where height >= 180;

select name, weight from student where weight >= 60 and weight <=80;

select name, deptno1 from student where deptno1 = 101 or deptno1 = 201 or deptno1 = 301;

select name from student where name like '��%';

select name, bonus from professor where bonus is not null;

select name, grade, height from student where grade = 4 and height > 170;

select name, height, grade, weight from student where grade = 1 or weight >= 80;

select name, grade, height, weight from student where grade = 2 and height > 180 and weight > 70 ;

select name, grade, height, weight from student where grade = 2 and (height > 180 or weight > 70);

select name, height from student where grade = 1 order by height desc ; --���������� asc ���������� desc

select name, height, weight from student where grade = 1 order by weight desc, height asc;

select name, birthday, height, weight from student where grade =1 order by 2 desc;

select name "�̸�", height "Ű" from student where grade = 1 order by Ű ;

select studno , name, deptno1 from student where deptno1 = 101 union select profno, name, deptno from professor where deptno = 101 ;

select studno , name, deptno1 from student where deptno1 = 101 union all select profno, name, deptno from professor where deptno = 101 ; --union all: �ߺ��� �� ��� ����
-- Į���� ������ �ٸ��� ������ �߻��ϹǷ� union ���� �ڿ� select�� ������ Į���� ����� �ȵǴ��� ���������.

--intersect : ������
select name from student where deptno1 = 101 intersect select name from student where deptno2 = 201;

--minus ���� : ū �ſ��� ���� �� ����
select name, position from professor minus select name, position from professor where position = '���Ӱ���';

--sql �������Լ�
select initcap(id) from student where deptno1 = 201  ; 

select initcap('Pretty girl') from dual; --from dual�̶� 

select name �̸�, id, lower(id) �ҹ���, upper(id) �빮�� from student where deptno1 = 201;

select name, id, length(id) ���ڼ� from student where length(id)>9; --length()

select name, length(name), lengthb(name) from student ; -- lengthb(): ����Ʈ ��

select substr('ABCDE', 2,3) from dual; --substr('���ڿ�' �Ǵ� Į����, ���� ��ġ, ������ ���ڼ�)

select substr('ABCDE', -2,3) from dual; -- ������ �ε���

select name, substr(jumin,1,6) "�������" from student where deptno1 = 101;

desc student; --�غ� ��� jumin �÷��� char �̴�.

select name, substr(jumin, 1, 6) ������� from student where substr(jumin, 3, 2) = '08';

select substr(name,1,2) from student where deptno1 = 101;

select instr('A*B*C*','*',3,2) from dual;

select name, tel, instr(tel,')',1,1) from student where deptno1=101;

select rpad(tel,5,'*') from student where deptno1 =101;

select id, lpad(id,10,'$') lapd from student where deptno1=101;

select ltrim(dname,'��') from dept2;

select rtrim(dname,'��') from dept2;

select replace(name, substr(name,1,1),'#') from student where deptno1=101;

-- SQL ���忡�� ���Խ� ����ϱ�
select * from reg_test;

select * from reg_test where regexp_like(text, '[a-z]?[0-9]'); -- ������ ���� ���� ��� ?�� ���ش�

--�ð��Լ�
select sysdate from dual;

select months_between('2022-01-20', '2002-09-07') from dual;

select sysdate, next_day(sysdate, 'MON') from dual;

select sysdate, add_months(sysdate,3) from dual;

--�� ��ȯ �Լ�
select to_char(sysdate,'DD') DD , to_char(sysdate,'DAY') DAY , to_char(sysdate,'DDTH') DDTH from dual;

select name, to_char((pay*12)+bonus,'99,999') ���� from professor where deptno=101;

select name,pay,bonus,(pay*12+NVL(bonus,0)) ���� from professor where deptno = 101;

select name, pay, bonus, nvl2(bonus,pay*12+bonus,pay*0) ���� from professor where deptno=101;

-- decode �Լ�
select name,deptno, decode(deptno,101,'��ǻ�Ͱ��а�',102, '��Ƽ�̵����а�',103,'����Ʈ������а�','��Ÿ�а�') �а��� from professor;

select name, deptno,decode(deptno,101,decode(name,'������','���±����ĺ�','�ĺ��ƴ�')) "��  ��" from professor;

--case ǥ����
select name, tel, case(substr(tel,1,4)-1) when '02'  then '����' else '��Ÿ' end ������ from student; --error

select name, substr(jumin,3,2) "�����", case when (substr(jumin,3,2)) between '01' and '03' then '1/4�б�' 
when (substr(jumin,3,2)) between '04' and '06' then '2/4�б�'
when (substr(jumin,3,2)) between '07' and '09' then '3/4�б�'
when (substr(jumin,3,2)) between '10' and '12' then '4/4�б�' else '���¾' end "�б⺰" from student;

select * from student;


--join

--īƼ�� ��
select * from emp;
select * from dept;
select e.ename, d.dname from emp e, dept d;

--� join
select s.name, s.deptno1, d.dname from student s , department d where s.deptno1= d.deptno;
select * from student;
select * from department;
select s.name, d.dname, p.name from student s, department d, professor p where s.deptno1 = d.deptno and s.profno=p.profno;

select * from emp2;
select * from p_grade;
select e.name, e.position, e.pay, p.s_pay, p.e_pay from emp2 e, p_grade p where e.position=p.position;

--�� join
select * from gogak;
select * from gift;
select go.gname, go.point, gi.gname from gogak go, gift gi where go.point between gi.g_start and gi.g_end;

select gi.gname, count(*) from gogak go, gift gi where go.point between gi.g_start and g_end group by gi.gname; --group by�� �ߺ� ���� 

select s.name, e.total, h.grade from student s, exam_01 e, hakjum h where s.studno=e.studno and e.total between h.min_point and h.max_point;

select go.gname, go.point, gi.gname from gogak go, gift gi where gi.g_start <= go.point and gi.gname='��ǿ�������';

select e.name, trunc((sysdate-e.birthday)/365.0), e.position, g.position from emp2 e, p_grade g where trunc((sysdate-e.birthday)/365.0) between g.s_age and g.e_age;

--outer join
select s.name ,p.name from student s, professor p where s.profno(+)=p.profno order by 1;

--self join
select * from dept2;
select a.dname, b.dname from dept2 a, dept2 b where a.pdept = b.dcode;






