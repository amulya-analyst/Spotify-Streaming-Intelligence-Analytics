create database spotify_analysis;
use spotify_analysis;

select count(*) from spotify_data;

select * from spotify_data
limit 10;

-- Average Popularity by Genre --
select genre,
avg(popularity) as avg_popularity
from spotify_data
group by genre
order by avg_popularity desc;

-- Total Streams by Country --
select country,
sum(streams) as total_streams
from spotify_data
group by country
order by total_streams desc;

-- Revenue by Subscription Plan --
select subscription_plan,
round(sum(revenue_usd),2) as total_revenue
from spotify_data
group by subscription_plan
order by total_revenue desc;

-- Top 10 Most Streamed Songs --
select track_name, artist, streams
from spotify_data
order by streams desc
limit 10;

-- Average Streams by Genre --
select genre,
avg(streams) as avg_streams
from spotify_data
group by genre
order by avg_streams desc;

-- Popularity Category Distribution --
SELECT 
CASE
    WHEN popularity >= 80 THEN 'Hit'
    WHEN popularity >= 60 THEN 'Popular'
    WHEN popularity >= 40 THEN 'Average'
    ELSE 'Low'
END AS popularity_category,
COUNT(*) AS song_count
FROM spotify_data
GROUP BY 
CASE
    WHEN popularity >= 80 THEN 'Hit'
    WHEN popularity >= 60 THEN 'Popular'
    WHEN popularity >= 40 THEN 'Average'
    ELSE 'Low'
END
ORDER BY song_count DESC;

-- Average Popularity by Country --
SELECT country,
AVG(popularity) AS avg_popularity
FROM spotify_data
GROUP BY country
ORDER BY avg_popularity DESC;

-- Average Song Duration by Genre --
SELECT genre,
AVG(duration_ms)/60000 AS avg_duration_minutes
FROM spotify_data
GROUP BY genre
ORDER BY avg_duration_minutes DESC;

-- Payment Method Distribution --
SELECT payment_method,
COUNT(*) AS users
FROM spotify_data
GROUP BY payment_method;

-- Average Revenue per Premium User --
SELECT
round(AVG(revenue_usd),2) AS avg_revenue
FROM spotify_data
WHERE subscription_plan = 'Premium';