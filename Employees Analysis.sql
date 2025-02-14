-- SELECT * FROM data_new.salaries;
-- use data_new
-- 1. Show all the columns and the rows in the table.
select * from salaries;

-- 2. Show only the EmployeeName and JobTittle columns.
select EmployeeName,JobTitle from salaries;

-- 3. Show the Number of employee in the table.
select count(*) from salaries;

-- 4. Show the unique job title in the table and count it.
select count(distinct JobTitle) from salaries;

-- 5. show the job title and the overtime pay for all employees with overtime pay >50000
select JobTitle,OvertimePay from salaries
where OvertimePay > 50000;

-- 6. Avg Base pay for the all employees.
select avg(BasePay) as "Avg BasePay" from salaries;

-- 7. Show the top ten highest paid Employees.
select EmployeeName, TotalPay from salaries
order by TotalPay desc
limit 10;

-- 8. Show the Average of the BasePay, OvertimePay and OtherPay for each Employee:
select EmployeeName, (BasePay + OvertimePay + OtherPay)/3 as avg_bp_op_otp from salaries;

-- 9. Show the all emplyees who have the word 'Manager' in their job title.
select EmployeeName, JobTitle from salaries
where JobTitle like '%Manager%';

-- 10. Show all employees with a job title  not equal to 'Manager'.
select EmployeeName, JobTitle from salaries
where JobTitle <>'Manager';

-- 11. show all the employees with total pay between 50000 and 75000.
select * from salaries
where TotalPay > 50000 and TotalPay < 75000;

select * from salaries 
where TotalPay between 50000 and 75000;

-- 12. show all the employyes with a base pay less than 50000 or a total pay is greater than 100000
select * from salaries
where BasePay < 50000 or TotalPay > 100000;

-- 13. Show all the employees with a total pay benefits values between 125000 and 150000
-- and a job title containing the word 'Director'.
select * from salaries
where TotalPayBenefits between 125000 and 150000
and JobTitle like '%Director%';

-- 14. Show all the employees ordered by their total pay benefits in Decreasing order.
select * from salaries
order by TotalPayBenefits desc;

-- 15. Show all the job title with an average base pay of at 
-- least 100000 and order them by the average base pay in desc order.
select JobTitle, avg(BasePay) as "averageBP" from salaries
group by JobTitle
having avg(BasePay) >= 100000
order by averageBP desc;

-- 16. Delete the column.
select * from salaries;
alter table salaries
drop column Notes;
select * from salaries;

-- 17. Update the base pay of all employee with the 
-- job title containing "Manager" by inceasing it by 10%.
set SQL_SAFE_UPDATES = 0;
update salaries
set BasePay = BasePay * 1.1
where JobTitle like "%Manager%";
select * from salaries;
SET SQL_SAFE_UPDATES = 1;

-- 18. Delete all Employees who have no Overtime Pay.
select count(*) from salaries
where OvertimePay = 0 ;
set sql_safe_updates = 0;
delete from salaries
where OvertimePay = 0
 









