-- Create a CTE to calculate the average score of posts by each user and
-- use it to:
-- ■ List users with an average score above 50.
-- ■ Rank users based on their average post score.

with UsersAvgScores as (
select id as user_id, avg(score) as avg_score from posts
    group by id
)

select user_id, avg_score from UsersAvgScores
where avg_score > 50;

WITH AverageUserScores AS (
    SELECT
        owner_user_id,
        AVG(score) AS average_score
    FROM
        posts
    GROUP BY
        owner_user_id
)

SELECT
    owner_user_id
FROM
    AverageUserScores
WHERE
    average_score > 50;
    
    
SELECT
    owner_user_id,
    average_score,
    DENSE_RANK() OVER (ORDER BY average_score DESC) AS user_rank
FROM
    AverageUserScores;
    
    
-- Simulate a hierarchy of linked posts using the post_links table.

WITH RECURSIVE PostHierarchy AS (
    -- Base case: Start with all posts that have links
    SELECT 
        pl.post_id, 
        pl.related_post_id, 
        1 AS level
    FROM post_links pl
    
    UNION ALL
    
    -- Recursive case: Join related posts to expand the hierarchy
    SELECT 
        ph.post_id, 
        pl.related_post_id, 
        ph.level + 1 AS level
    FROM PostHierarchy ph
    JOIN post_links pl ON ph.related_post_id = pl.post_id
)
SELECT * FROM PostHierarchy
ORDER BY post_id, level;
