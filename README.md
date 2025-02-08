# Stack Overflow Post Analysis: A SQL Portfolio Project

## 📌 Project Overview
This project analyzes the history of Stack Overflow posts, including edits, comments, votes, and linked questions. The goal is to extract meaningful insights using SQL while working with a Kaggle dataset.

## 📂 Dataset
The dataset is sourced from Kaggle: [Stack Overflow Dataset](https://www.kaggle.com/datasets/stackoverflow/stackoverflow/data?select=post_history)

### Tables Used:
- `badges` → Tracks badges earned by users.
- `comments` → Contains comments on posts.
- `post_history` → Tracks post edits and changes.
- `post_links` → Stores links between related posts.
- `posts_answers` → Contains questions and answers.
- `tags` → Stores tags associated with posts.
- `users` → User details including reputation.
- `votes` → Tracks voting activity.
- `posts` → Stores post details.

## 🛠 SQL Concepts Covered
### 🔹 **Part 1: Basics**
- Exploring dataset structure.
- Filtering and sorting records.
- Aggregations: counting badges, calculating average post scores.

### 🔹 **Part 2: Joins**
- Joining post history with posts to track content evolution.
- Finding total badges earned by each user.
- Combining `posts`, `comments`, and `users` to extract insights.

### 🔹 **Part 3: Subqueries**
- Identifying top users by reputation.
- Retrieving highest-scoring posts per post type.
- Counting related posts using correlated subqueries.

### 🔹 **Part 4: Common Table Expressions (CTEs)**
- Using **non-recursive CTEs** to compute average post scores per user.
- Implementing **recursive CTEs** to simulate linked post hierarchies.

### 🔹 **Part 5: Advanced Queries**
- Ranking posts by score within each year.
- Calculating a running total of badges for each user.
- Analyzing user contributions via comments, edits, and votes.
- Investigating the most commonly earned badges.
- Identifying tags linked to high-scoring posts.
- Measuring knowledge sharing via linked posts.

## 📊 Insights Discovered
- **Most Active Contributors** → Users with the most edits, comments, and votes.
- **Popular Badges** → Which badges are awarded most frequently.
- **Best Tags** → Tags associated with high-scoring posts.
- **Knowledge Sharing** → How often questions are linked and reused.

## 📜 SQL Scripts
| Query Type | SQL File |
|------------|------------|
| Basic Queries | [`queries/basics.sql`](queries/basics.sql) |
| Joins | [`queries/joins.sql`](queries/joins.sql) |
| Subqueries | [`queries/subqueries.sql`](queries/subqueries.sql) |
| Common Table Expressions (CTEs) | [`queries/cte.sql`](queries/cte.sql) |
| Advanced SQL | [`queries/advanced_queries.sql`](queries/advanced_queries.sql) |

## 🚀 Running the Queries
- Ensure you have **MySQL or PostgreSQL** installed.
- Import the Kaggle dataset into your database.
- Run the SQL queries from the `queries/` folder.

## 📌 Future Improvements
- Add **visualizations** using Python (Matplotlib/Seaborn).
- Automate queries using **SQL scripts & stored procedures**.
- Expand analysis with **more advanced ranking & trend insights**.

---
