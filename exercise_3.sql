with ranked_time as (SELECT *, 
rank() over(partition by user_id order by transaction_date)
FROM transactions)

select user_id, spend, transaction_date from ranked_time
where rank = 3
