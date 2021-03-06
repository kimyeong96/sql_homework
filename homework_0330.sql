select * from employee;

-- 1. 직원명과 이메일 , 이메일 길이를 출력하시오

select emp_name "이름", email "이메일", length(email) "이메일 길이" from employee;


-- 2. 직원의 이름과 이메일 주소중 아이디 부분만 출력하시오

select emp_name "이름", rtrim(email,'@kh.or.kr')"이메일 아이디" from employee;


-- 3. 직원명과 주민번호를 조회하시오 

select emp_name "이름" , substr(emp_no,1,8) || '******' "주민번호" from employee;


-- 4. 부서코드가 D5, D9인 직원들 중에서 2004년도에 입사한 직원의 수 조회함.

select emp_id "사번", emp_name "사원명", dept_code "부서코드", hire_date "입사일" from employee
    where dept_code in ('D5','D9') and hire_date like '04%';


-- 5. EMPLOYEE 테이블의 모든 직원의 이름,주민번호,Email을 출력하시오
-- 단, 출력시 Email은 kh.or.kr에서 iei.or.kr 로 변경하여 출력되게 하시오 

select emp_name "이름", emp_no "주민번호", rtrim(email,'@kh.or.kr') || '@iei.or.kr' "이메일" from employee;
select emp_name "이름", emp_no "주민번호", replace(email,'@kh.or.kr','@iei.or.kr') "이메일" from employee;


----- workbook -----
-- 1. 춘 기술대학교의 학과 이름과 계열을 표시하시오. 단, 출력 헤더는 "학과 명", "계열"으로 표시하도록 핚다
select department_name , category  from TB_DEPARTMENT;


-- 2. 학과의 학과 정원을 다음과 같은 형태로 화면에 출력핚다.
select department_name || '의 정원은 ' || capacity || '명 입니다.' from TB_DEPARTMENT;
-- || 문자열이나 컬럼을 합쳐준다 


-- 3. "국어국문학과" 에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이
-- 들어왔다. 누구인가? (국문학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서
-- 찾아 내도록 하자)

select student_name from TB_STUDENT
    where department_no = '001' 
        and student_ssn like '%-2%' 
        and absence_yn = 'Y';


-- 4. 도서관에서 대출 도서 장기 연체자 들을 찾아 이름을 게시하고자 핚다. 그 대상자들의 
-- 학번이 다음과 같을 때 대상자들을 찾는 적젃핚 SQL 구문을 작성하시오.

select distinct student_name from TB_STUDENT
    where student_no in ('A513079','A513090','A513091','A513110','A513119')
    order by 1 desc;
   
   
-- 5. 입학정원이 20 명 이상 30 명 이하인 학과들의 학과 이름과 계열을 출력하시오.

select department_name, category from TB_DEPARTMENT
    where capacity between 20 and 30;

-- 6. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다. 그럼 춘기술대학교 총장의 이름을 알아낼 수 있는 
-- SQL 문장을 작성하시오.

select professor_name from TB_PROFESSOR
    where department_no is null;


-- 7. 혹시 젂산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 핚다.
-- 어떠한 SQL 문장을 사용하면 될 것인지 작성하시오.

select student_name from TB_STUDENT
    where department_no is null;
    
    
    
-- 8. 수강신청을 하려고 핚다. 선수과목 여부를 확인해야 하는데, 선수과목이 존재하는
-- 과목들은 어떤 과목인지 과목번호를 조회해보시오.

select class_no from TB_CLASS
    where preattending_class_no is not null;
    
    
    
-- 9. 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회해보시오.

select distinct category from TB_DEPARTMENT;
-- 중복 제거 


-- 10. 02 학번 젂주 거주자들의 모임을 맊들려고 핚다. 휴학핚 사람들은 제외핚 재학중인
-- 학생들의 학번, 이름, 주민번호를 출력하는 구문을 작성하시오.

select student_no , student_name, student_ssn from TB_STUDENT
    where student_address like '%전주시%' and entrance_date like '02%' and absence_yn = 'N';



