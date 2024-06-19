SELECT extract(year from transaction_date) as yr,
product_id, spend as curr_year_spend, 
lag(spend) over(partition by product_id order by extract(year from transaction_date)) as prev_year_spend, 
round((spend-lag(spend) over(partition by product_id order by extract(year from transaction_date)))*100/lag(spend) over(partition by product_id order by extract(year from transaction_date)),2) as yoy_rate
FROM user_transactions
