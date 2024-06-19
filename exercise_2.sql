with ranked_time as (select *,
rank () over(partition by card_name order by issue_year, issue_month)
from monthly_cards_issued)

select card_name, issued_amount from ranked_time
where rank = 1
order by issued_amount desc
