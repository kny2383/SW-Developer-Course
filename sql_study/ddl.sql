--DDL
CREATE table ddl_test1(no number(3), name VARCHAR2(10), birth date default sysdate);
select * from ddl_test1;
desc ddl_test1;

--���̺� �����ϱ�: CTAS
create table dept3 as select * from dept2; --dept2�� ���� dept3 ����
create table dept5 as select * from dept2 where 1=2; --

--���� Į�� ���̺� ����
create table vt001(no1 number, no2 number, no3 number generated always as (no1+no2)virtual);
insert into vt001(no1,no2) values (1,2) ;
update vt001 set no1 =10;
select * from vt001;
insert into vt001(no1,no2) values (3,4);
insert into vt001(no1,no2) values (6,6);
alter table vt001 add(no4 generated always as ((no1*12)+no2));
select column_name, data_type, data_default from user_tab_columns where table_name='VT001' order by column_id;

--ALTER
create table dept6 as select dcode,dname from dept2 where dcode in(1000,1001,1002);
alter table dept6 add(LOC VARCHAR2(10));
alter table dept6 add(LOC2 VARCHAR2(10) DEFAULT '����'); -- Į�� �߰�
select * from dept6;
alter table dept6 rename column loc2 to area; -- Į�� �̸� ����
rename dept6 to dept7; -- ���̺� �̸� ����
desc dept7;
alter table dept7 modify(dcode VARCHAR2(10)); -- Į���� ������ ũ�� ����
alter table dept7 drop column loc; -- Į�� ����

--truncate
truncate table dept7; -- ���̺��� ������ ���� ���� �ݳ� but ���̺� ��ü�� �������� �� �ƴ�
drop table dept7; -- ���̺� ��ü ����
