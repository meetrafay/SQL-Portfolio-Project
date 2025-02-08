-- Rank posts based on their score within each year (posts table).

SELECT 
    id AS post_id,
    title,
    score,
    YEAR(creation_date) AS post_year,
    RANK() OVER (
        PARTITION BY YEAR(creation_date) 
        ORDER BY score DESC
    ) AS rank_within_year
FROM posts
ORDER BY post_year, rank_within_year;
    

-- Calculate the running total of badges earned by users (badges table).

SELECT 
    user_id, 
    name AS badge_name, 
    date AS earned_date, 
    COUNT(*) OVER (
        PARTITION BY user_id 
        ORDER BY date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM badges
ORDER BY user_id, date;

    
