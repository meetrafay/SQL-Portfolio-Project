-- Which users have contributed the most in terms of comments, edits, and votes?

SELECT 
    u.id AS user_id,
    u.display_name,
    COUNT(DISTINCT c.id) AS comment_count,
    COUNT(DISTINCT ph.id) AS edit_count,
    COUNT(DISTINCT v.id) AS vote_count,
    (COUNT(DISTINCT c.id) + COUNT(DISTINCT ph.id) + COUNT(DISTINCT v.id)) AS total_contributions
FROM users u
LEFT JOIN comments c ON u.id = c.user_id
LEFT JOIN post_history ph ON u.id = ph.user_id
LEFT JOIN votes v ON u.id = v.post_id
GROUP BY u.id, u.display_name
ORDER BY total_contributions DESC
LIMIT 10;



-- What types of badges are most commonly earned, and which users are the top
-- earners?

-- Most common badge types
SELECT 
    name AS badge_name, 
    COUNT(*) AS total_earned
FROM badges
GROUP BY name
ORDER BY total_earned DESC
LIMIT 10;

-- Users with the most badges
SELECT 
    u.id AS user_id, 
    u.display_name, 
    COUNT(b.id) AS badge_count
FROM users u
JOIN badges b ON u.id = b.user_id
GROUP BY u.id, u.display_name
ORDER BY badge_count DESC
LIMIT 10;

    
    
-- Which tags are associated with the highest-scoring posts?

SELECT 
    t.tag_name,
    AVG(p.score) AS avg_score
FROM posts p
JOIN post_links pl ON p.id = pl.post_id
JOIN tags t ON pl.related_post_id = t.id
GROUP BY t.tag_name
ORDER BY avg_score DESC
LIMIT 10;


-- How often are related questions linked, and what does this say about knowledge
-- sharing?


SELECT 
    COUNT(*) AS total_links,
    COUNT(DISTINCT post_id) AS distinct_posts_linked,
    COUNT(*) / COUNT(DISTINCT post_id) AS avg_links_per_post
FROM post_links;
