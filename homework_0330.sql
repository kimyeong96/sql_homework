select * from employee;

-- 1. ������� �̸��� , �̸��� ���̸� ����Ͻÿ�

select emp_name "�̸�", email "�̸���", length(email) "�̸��� ����" from employee;


-- 2. ������ �̸��� �̸��� �ּ��� ���̵� �κи� ����Ͻÿ�

select emp_name "�̸�", rtrim(email,'@kh.or.kr')"�̸��� ���̵�" from employee;


-- 3. ������� �ֹι�ȣ�� ��ȸ�Ͻÿ� 

select emp_name "�̸�" , substr(emp_no,1,8) || '******' "�ֹι�ȣ" from employee;


-- 4. �μ��ڵ尡 D5, D9�� ������ �߿��� 2004�⵵�� �Ի��� ������ �� ��ȸ��.

select emp_id "���", emp_name "�����", dept_code "�μ��ڵ�", hire_date "�Ի���" from employee
    where dept_code in ('D5','D9') and hire_date like '04%';


-- 5. EMPLOYEE ���̺��� ��� ������ �̸�,�ֹι�ȣ,Email�� ����Ͻÿ�
-- ��, ��½� Email�� kh.or.kr���� iei.or.kr �� �����Ͽ� ��µǰ� �Ͻÿ� 

select emp_name "�̸�", emp_no "�ֹι�ȣ", rtrim(email,'@kh.or.kr') || '@iei.or.kr' "�̸���" from employee;
select emp_name "�̸�", emp_no "�ֹι�ȣ", replace(email,'@kh.or.kr','@iei.or.kr') "�̸���" from employee;


----- workbook -----
-- 1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭"���� ǥ���ϵ��� ����
select department_name , category  from TB_DEPARTMENT;


-- 2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 �������.
select department_name || '�� ������ ' || capacity || '�� �Դϴ�.' from TB_DEPARTMENT;
-- || ���ڿ��̳� �÷��� �����ش� 


-- 3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û��
-- ���Դ�. �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ�
-- ã�� ������ ����)

select student_name from TB_STUDENT
    where department_no = '001' 
        and student_ssn like '%-2%' 
        and absence_yn = 'Y';


-- 4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� ����. �� ����ڵ��� 
-- �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.

select distinct student_name from TB_STUDENT
    where student_no in ('A513079','A513090','A513091','A513110','A513119')
    order by 1 desc;
   
   
-- 5. ���������� 20 �� �̻� 30 �� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.

select department_name, category from TB_DEPARTMENT
    where capacity between 20 and 30;

-- 6. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�. �׷� �������б� ������ �̸��� �˾Ƴ� �� �ִ� 
-- SQL ������ �ۼ��Ͻÿ�.

select professor_name from TB_PROFESSOR
    where department_no is null;


-- 7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� ����.
-- ��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.

select student_name from TB_STUDENT
    where department_no is null;
    
    
    
-- 8. ������û�� �Ϸ��� ����. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ�
-- ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�.

select class_no from TB_CLASS
    where preattending_class_no is not null;
    
    
    
-- 9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.

select distinct category from TB_DEPARTMENT;
-- �ߺ� ���� 


-- 10. 02 �й� ���� �����ڵ��� ������ ������� ����. ������ ������� ������ ��������
-- �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�.

select student_no , student_name, student_ssn from TB_STUDENT
    where student_address like '%���ֽ�%' and entrance_date like '02%' and absence_yn = 'N';



