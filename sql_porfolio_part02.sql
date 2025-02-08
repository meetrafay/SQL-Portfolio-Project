-- Combine the post_history and posts tables to display the title of
-- posts and the corresponding changes made in the post history.

select p.title, ph.text from posts p
join post_history ph on p.id = ph.post_id;


-- Join the users table with badges to find the total badges earned by each
-- user.

select u.display_name, count(b.id) as badges_count from users u
join badges b on u.id = b.user_id group by u.id;


-- Fetch the titles of posts (posts), their comments (comments), and the
-- users who made those comments (users).

SELECT 
    p.title, 
    GROUP_CONCAT(c.text SEPARATOR ', ') AS comments,
    GROUP_CONCAT(u.display_name SEPARATOR ', ') AS commented_by
FROM 
    posts p
JOIN 
    comments c ON p.id = c.post_id
JOIN 
    users u ON c.user_id = u.id
GROUP BY 
    p.id;

    
-- Combine post_links with posts to list related questions.
select * from posts;
select * from post_links;
select * from posts p
join post_links pl on p.id = pl.post_id;


-- Join the users, badges, and comments tables to find the users who have
-- earned badges and made comments.

SELECT 
    u.display_name
FROM 
    users u
JOIN 
    comments c ON u.id = c.user_id
JOIN 
    badges b ON u.id = b.user_id
where 
	b.name IS NOT NULL 
    AND c.text IS NOT NULL
group by 
	u.id;
