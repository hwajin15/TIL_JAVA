select last_name, job_id , salary as Sal from employees; //����

select * from job_grades; // ����

x -> * as ��� �Ǵ� "" , last_name,

DESCRIBE departments;

DESCRIBE employees;

select employee_id , last_name , job_id , hire_date as STARTDATE
FROM employees;

select distinct job_id from employees;

select employee_id as Emp# , last_name "Employee" , job_id as job , hire_date as "Hire Date"
FROM employees;

select last_name ||', ' || job_id as "Employee and Title" from employees; 

SELECT employee_id || ',' || first_name || ',' || last_name
 || ',' || email || ',' || phone_number || ','|| job_id
 || ',' || manager_id || ',' || hire_date || ','
 || salary || ',' || commission_pct || ',' ||
department_id
 as THE_OUTPUT
FROM employees;
