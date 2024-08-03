/* select * from services;
select * from calls;
select * From queues;

select DISTINCT(queue_id) from calls;
select DISTINCT(called) from queues;


select service_id,token_letter,count(*) as Total_Visitor,
COUNT(case when call_status_id = 1 then 1 END) as Served,
Count(case when call_status_id = 2 then 1 END) as noshow,
count(case when call_status_id = NULL THEN 1 END) as Serving
from calls where called_date = '2024-02-14'
group by service_id;
*/

select c.service_id,c.token_letter,count(*) as Total_Visitor,
COUNT(CASE WHEN q.called = 0 then 1 END) AS Queued,
COUNT(CASE WHEN q.called = 1 Then 1 end) AS Called,
count(case when call_status_id = NULL THEN 1 END) as Serving,
COUNT(case when call_status_id = 1 then 1 END) as Served,
Count(case when call_status_id = 2 then 1 END) as no_show
from calls c left join queues q ON
c.queue_id = q.id
where c.called_date = '2024-02-14'
group by c.service_id;








