with ranked as (SELECT transaction_date, user_id, 
rank () over(partition by user_id order by transaction_date) FROM user_transactions)

select transaction_date, user_id, count(user_id) as purchase_count from ranked
where rank = 1
group by user_id, transaction_date
