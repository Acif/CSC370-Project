-- Calculate the average user rating for each movie.
-- Includes movies that have not received any user ratings.
SELECT
    m.movie_id,
    m.title,
    ROUND(AVG(r.rating), 2) AS user_rating_average,
    COUNT(r.user_id) AS user_rating_count
FROM Movies AS m
LEFT JOIN Ratings AS r
    ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title;