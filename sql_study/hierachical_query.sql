--������ ���� hierachical query
--prior : �ش� Ű���尡 ���� �Ǿ� �ִ� �÷����� �ٷ� ������ �������� ���� ã�µ� ���
select lpad(dname,level*6,'*') �μ��� from dept2 connect by prior dcode = pdept start with dcode = 0001;
select lpad(dname,level*7,'*') �μ��� from dept2 connect by dcode = prior pdept start with dcode = 1011;