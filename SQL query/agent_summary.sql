select  u.name,c.token_letter,count(*) as Total_Visitor,
COUNT(CASE WHEN q.called = 0 then 1 END) AS Queued,
COUNT(CASE WHEN q.called = 1 Then 1 end) AS Called,
count(case when call_status_id = NULL THEN 1 END) as Serving,
COUNT(case when call_status_id = 1 then 1 END) as Served,
Count(case when call_status_id = 2 then 1 END) as no_show
from calls c
left join users u on 
c.user_id = u.id
LEFt JOIN queues q on 
c.queue_id = q.id
where c.called_date = '2024-02-14'
group by u.name,c.token_letter
order by u.name;