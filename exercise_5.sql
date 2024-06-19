SELECT user_id, tweet_date, 
round(avg(tweet_count) over(partition by user_id order by tweet_date rows between 2 preceding and current row),2)
FROM tweets;
