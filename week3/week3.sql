-- ᄋ‘Corporate’ branch에 해당하는 모든 사원의 이름, 기존 급여, 10% 증가된 급여를 출력하라. 2
-- ᄋ급여가 60,000에서 80,000 사이에 있는 모든 남자 사원의 이름, 급여를 출 력하라. 5
-- ᄋ모든 사원을 1. branch_id(내림차순) 2. 급여(오름차순)으로 정렬하고, 이름, branch_id, 급여를 출력하라. 9
-- ᄋ‘FedEx’와 일하는 급여 60,000 이상의 모든 사원의 이름, salary를 출 력하라. 3
-- ᄋ사원의 급여의 합, 최고 급여, 최저 급여, 평균 급여를 출력하라. 1
-- ᄋ회사의 총 사원수를 제시하라. 1
-- ᄋ각 branch별 근무하는 사원의 수를 검색하여 branch 이름과 소속 사원수 를 출력하라 3

select first_name, last_name, salary, salary*1.1 AS increased_salary
FROM employee WHERE branch_id=1;

select first_name, last_name, salary
FROM employee WHERE 60000<=salary AND salary<=80000 AND sex = "M";

select first_name, last_name, branch_id, salary
FROM employee ORDER BY branch_id DESC, salary ASC;

select first_name, last_name, total_sales
FROM employee e
INNER JOIN works_with ww ON e.emp_id = ww.emp_id
INNER JOIN client c ON ww.client_id = c.client_id
WHERE c.client_id = 406 OR c.client_id = 402 AND salary >= 60000;

select SUM(salary) AS total_salary, MAX(salary) AS max_salary, MIN(salary) AS min_salary, AVG(salary) AS avg_salary
FROM employee;

select COUNT(*)AS total_employees FROM employee;

select b.branch_name, COUNT(e.branch_id) AS employee_in_branch
FROM employee e
INNER JOIN branch b ON e.branch_id = b.branch_id
GROUP BY branch_name;