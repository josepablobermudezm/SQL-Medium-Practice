# Write your MySQL query statement below

/*
-- first approach, not really sure why the "null" is not accepted as an answer
with a as (
select 
    salary,
    row_number() over(order by salary desc) as nRow
from Employee
)

select 
     ifnull(salary, null) as SecondHighestSalary 
from a
where nRow = 2
*/

select 
    max(Salary) as SecondHighestSalary 
from Employee 
where Salary < (select max(Salary) from Employee)