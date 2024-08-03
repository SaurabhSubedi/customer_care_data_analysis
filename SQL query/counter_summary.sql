/* select * from counters;
select * from call_statuses;
select counter_id,called_date,call_status_id from calls;


select counter_id, count(*) as Total_queue_called from calls
where called_date = '2024-02-14'
group by counter_id;

select counter_id,
COUNT(case when call_status_id = 1 then 1 END) as Served,
Count(case when call_status_id = 2 then 1 END) as noshow,
count(case when call_status_id = NULL THEN 1 END) as Serving
from calls where called_date = '2024-02-14'
group by counter_id;
*/


with temp_table as (
select counter_id,count(*) as Total_queue_called,
COUNT(case when call_status_id = 1 then 1 END) as Served,
Count(case when call_status_id = 2 then 1 END) as noshow,
count(case when call_status_id = NULL THEN 1 END) as Serving
from calls where called_date = '2024-02-14'
group by counter_id
)

select cn.id as counter_id, tt.Total_queue_called, tt.Served, tt.noshow,tt.Serving  from counters cn
left join temp_table tt
on cn.id = tt.counter_id;