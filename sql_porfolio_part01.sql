-- Explore the structure and first 10 rows of each table.

select * from badges limit 10;
select * from comments limit 10;
select * from post_history limit 10;
select * from post_links limit 10;
select * from posts limit 10;
select * from posts_answers limit 10;
select * from tags limit 10;
select * from users limit 10;
select * from votes limit 10;

-- Identify the total number of records in each table.

select count(*) from badges;
select count(*) from comments;
select count(*) from post_history;
select count(*) from post_links;
select count(*) from posts;
select count(*) from posts_answers;
select count(*) from tags;
select count(*) from users;
select count(*) from votes;


-- Find all posts with a comment_count greater than 2

select p.title, count(c.id) as comment_count 
from posts p
join comments c on p.id = c.post_id 
group by p.title 
having count(c.id) > 2;


-- Display comments made in 2012, sorted by creation_date (comments
-- table).

select text, year(creation_date) as years
from comments 
where year(creation_date) = 2012 
order by creation_date;


-- Count the total number of badges (badges table).

select count(*) from badges;


-- Calculate the average score of posts grouped by post_type_id
-- (posts_answer table).

select avg(score) as avg_post_score_by_post_type from posts_answers
group by post_type_id;
