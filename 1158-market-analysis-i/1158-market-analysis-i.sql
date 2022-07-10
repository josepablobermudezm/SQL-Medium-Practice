# Write your MySQL query statement below

/*

first long approach

with a as (
select 
    o.buyer_id, 
    u.join_date, 
    count(o.order_id) as orders_in_2019
from Users as u
left join Orders as o
on u.user_id = o.buyer_id
where year(o.order_date) = 2019
group by o.buyer_id
)

select * from a
union 
select 
    u.user_id as buyer_id, 
    u.join_date, 
    0 as orders_in_2019
from Users as u
where u.user_id not in (select buyer_id from a)

*/

SELECT 
    u.user_id AS buyer_id, 
    join_date, 
    COUNT(order_date) AS orders_in_2019 
FROM Users as u
LEFT JOIN
Orders as o
ON u.user_id = o.buyer_id
AND YEAR(order_date) = '2019'
GROUP BY u.user_id