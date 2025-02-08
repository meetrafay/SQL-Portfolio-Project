-- Find the user with the highest reputation (users table).

select display_name, reputation from users
where reputation = (select max(reputation) from users);


-- Retrieve posts with the highest score in each post_type_id (posts
-- table).
SELECT post_type_id, MAX(score) as max_score
    FROM posts
    GROUP BY post_type_id;
SELECT p.*
FROM posts p
JOIN (
    SELECT post_type_id, MAX(score) as max_score
    FROM posts
    GROUP BY post_type_id
) AS highest_scores
ON p.post_type_id = highest_scores.post_type_id
AND p.score = highest_scores.max_score;


-- For each post, fetch the number of related posts from post_links.

SELECT 
    p.title, 
    (SELECT COUNT(*) 
     FROM post_links 
     WHERE post_links.post_id = p.id 
        OR post_links.related_post_id = p.id) AS related_post_count
FROM 
    posts p;
    