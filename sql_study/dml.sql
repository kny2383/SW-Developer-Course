--DML
--INSERT
INSERT into dept2(dcode,dname,pdept,area) values(9001,'Ư��1��','������','�ӽ�����');
desc dept2; 
select * from dept2; --�� ������ Ȯ��

INSERT INTO dept2(dcode,dname,pdept) values(9002,'Ư��3��','������');

insert into professor(profno,name,id,position,pay,hiredate) values(5001,'�輳��','Love_me','������','510',sysdate);
select * from professor;

--INSERT�� �̿��Ͽ� ���� �� �Է�
CREATE TABLE professor2 AS SELECT * FROM professor;
INSERT INTO professor2 select * from professor;

select * from p_02;
INSERT ALL INTO p_01(no,name) VALUES(1,'AAA') INTO p_02(no,name) VALUES(2,'BBB') SELECT * FROM dual;

INSERT ALL WHEN profno between 100 and 1999 then 
    into p_01 values(profno,name) when profno between 2000 and 2999 then
    into p_02 values(profno,name) select profno,name from professor;
    
insert all into p_01 values(profno,name) 
    into p_02 values(profno,name)
    select profno,name from professor
    where profno between 3000 and 3999;
    
--UPDATE
UPDATE professor set bonus = 100 where position = '������';
update professor set pay = pay*1.15 where position = (select position from professor where name = '����ö') and pay < 250;

--DELETE
DELETE FROM dept2 where dcode between 9000 and 9100;

--MERGE
select * from p_total;
select * from total;

merge into p_total total using pt_101 p01 on (total.�ǸŹ�ȣ=p01.�ǸŹ�ȣ) when matched then 
    update set total.��ǰ��ȣ = p01.��ǰ��ȣ 
    when not MATCHED then
    insert values(p01.�ǸŹ�ȣ,p01.��ǰ��ȣ,p01.����,p01.�ݾ�);




