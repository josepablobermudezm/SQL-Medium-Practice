# Write your MySQL query statement below

/*

first long approach
with a as (
select 
    num,
    lead(num, 1) over(order by id) as nextR,
    lead(num, 2) over(order by id) as nextnextR
from Logs
)

select 
    distinct 
        num as ConsecutiveNums
from a
where nextR = num and nextnextR = num
*/

select 
    distinct 
        num as ConsecutiveNums
from Logs
where (Id + 1, Num) in (select * from Logs) and (Id + 2, Num) in (select * from Logs)


