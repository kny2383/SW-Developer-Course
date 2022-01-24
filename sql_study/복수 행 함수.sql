--SQL ���� �� �Լ�
--count �Լ�
select count(*), count(hpage) from professor;
select * from professor;

--sum,avg �Լ�
set null (null);
select name,bonus from professor;
select count(bonus), sum(bonus) , avg(bonus) from professor;
select count(*), sum(bonus), avg(nvl(bonus,0)) from professor;

--max,min �Լ�
select * from emp;
select max(sal),min(sal) from emp;
select max(hiredate), min(hiredate) from emp;

--group by ��
select deptno, avg(nvl(pay,0)) from professor group by deptno;
--where ���� �׷��Լ��� �� �������� �� �� ����(having�� ����ؾ���)
select deptno, avg(nvl(pay,0)) from professor where avg(pay) >450 group by deptno; 
--having
select deptno, avg(nvl(pay,0)) from professor group by deptno having avg(pay) >450;  -- having�� group by�� �� �� �� ��� ����

--rollup �Լ�
set pagesize 50;
select deptno,position,sum(pay) from professor group by position, rollup(deptno);

--cube �Լ�
select deptno,position, sum(pay) from professor group by deptno, cube(position);

--rank �Լ�
select rank('�۵���') within group (order by name) "RANK" from professor;
select profno, name, pay, rank() over (order by pay) as rank, rank() over (order by pay desc) as rank_desc from professor; 
