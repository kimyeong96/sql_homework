-- 1. �ֹι�ȣ�� 1970��� ���̸鼭 ������ �����̰�, ���� ������ �������� �����, �ֹι�ȣ, �μ���, ���޸��� ��ȸ�Ͻÿ�.
select emp_name "�����",
       emp_no "�ֹι�ȣ",
       dept_title "�μ���",
       job_name "���޸�"
from employee join department 
        on(dept_code = dept_id)
        join job using(job_code)
where substr(emp_no,1,1) = 7 and 
        emp_name like '��%' and 
        substr(emp_no,8,1) = 2;
       
       
       
--2. �̸��� '��'�ڰ� ���� �������� ���, �����, �μ����� ��ȸ�Ͻÿ�.
select 
    emp_id "���",
    emp_name "�����",
    dept_title "�μ���"
from employee join department 
     on(dept_code = dept_id)
where emp_name like '%��%';



--3. �ؿܿ����ο� �ٹ��ϴ� �����, ���޸�, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�.
select 
    emp_name "�����",
    job_name "���޸�",
    dept_id "�μ��ڵ�",
    dept_title "�μ���"
from employee join department 
    on(dept_code = dept_id) join job 
    using(job_code)
where dept_title like '�ؿ�%';



--4. ���ʽ�����Ʈ�� �޴� �������� �����, ���ʽ�����Ʈ, �μ���, �ٹ��������� ��ȸ�Ͻÿ�.
select 
     emp_name "�����",
     bonus "���ʽ�����Ʈ",
     dept_title "�μ���",
     local_name "�ٹ�������"
from employee join department 
    on(dept_code = dept_id) join location 
    on(location_id = local_code)
where bonus is not null;
    
    
    
--5. �μ��ڵ尡 D2�� �������� �����, ���޸�, �μ���, �ٹ��������� ��ȸ�Ͻÿ�. 
select    
    emp_name "�����",
    job_name "���޸�",
    dept_title "�μ���",
    local_name "�ٹ�������"
from employee join department 
    on(dept_code = dept_id)
    join location on(location_id = local_code)
    join job using(job_code)
where dept_code ='D2';



--6. �޿�������̺��� �ִ�޿�(MIN_SAL)�� -20�������� ���� �޴� �������� �����, ���޸�, �޿�, �ִ�޿��� ��ȸ�Ͻÿ�.
-- (������̺�� �޿�������̺��� SAL_LEVEL�÷��������� ������ ��)
select    
    emp_name "�����",
    job_name "���޸�",
    salary "�޿�",
    max_sal "�ִ� �޿�"
from employee join job 
    using(job_code) join sal_grade 
    using (sal_level)
where salary > (min_sal - 200000);


--7. �ѱ�(KO)�� �Ϻ�(JP)�� �ٹ��ϴ� �������� �����, �μ���, ������, �������� ��ȸ�Ͻÿ�.
select    
    emp_name "�����",
    dept_title "�μ���",
    local_name "������",
    national_code "������"
from employee join department 
    on(dept_code = dept_id) join location 
    on(location_id = local_code)
where national_code in ('KO','JP');


    
--8. ���� �μ��� �ٹ��ϴ� �������� �����, �μ���, �����̸��� ��ȸ�Ͻÿ�. (self join ���)
select
    e1.emp_name "�����",
    dept_title  "�μ���",
    e2.emp_name "�����̸�"
from
    employee e1 join department 
    on ( dept_id = dept_code ) join employee e2 
    using ( dept_code )
where
    e1.emp_name != e2.emp_name
order by 1;


--9. ���ʽ�����Ʈ�� ���� ������ �߿��� ������ ����� ����� �������� �����, ���޸�, �޿��� ��ȸ�Ͻÿ�. ��, join�� IN ����� ��
select 
    emp_name "�����",
    job_name "���޸�",
    salary "�޿�"
from employee join job 
    using(job_code)
where bonus is null and job_name in ('����','���');
    
    
    
--10. �������� ������ ����� ������ ���� ��ȸ�Ͻÿ�.
select 
    decode(ent_yn,'N','����','���') "����/���",
    count(*) || '��' "������"
from employee
    group by ent_yn;
    
    
    
--11. �� ������� �̸�,����(�ѱ�����),�μ���,��å���� ����Ͽ���.
-- �μ��� ������ '�μ�����' ��� / ���� �������� ���� 
select 
    emp_name "�����",
    2022 - (1900 + substr(emp_no,1,2)) || '��' "����",
    nvl(dept_title,'�μ�����') "�μ���",
    job_name "���޸�"
from employee left outer join department 
        on(dept_code = dept_id) join job 
        using(job_code)
order by 2 desc;