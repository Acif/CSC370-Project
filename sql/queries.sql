USE movie_rating_system;

-- Query 1: Average user rating and number of user ratings for each movie.
-- LEFT JOIN retains movies with no ratings.
SELECT
    m.movie_id,
    m.title,
    ROUND(AVG(r.rating), 2) AS user_rating_average,
    COUNT(r.user_id) AS user_rating_count
FROM Movies AS m
LEFT JOIN Ratings AS r
    ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
ORDER BY m.movie_id;


-- Query 3: Highest-rated movies with at least two user ratings.
SELECT
    m.title,
    ROUND(AVG(r.rating), 2) AS user_rating_average,
    COUNT(*) AS user_rating_count
FROM Movies AS m
JOIN Ratings AS r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
HAVING COUNT(*) >= 2
ORDER BY user_rating_average DESC, user_rating_count DESC, m.title;

-- Query 4: Movies in each genre, including genres without movies.
SELECT
    g.genre_name,
    m.title
FROM Genres AS g
LEFT JOIN MovieGenre AS mg ON g.genre_id = mg.genre_id
LEFT JOIN Movies AS m ON mg.movie_id = m.movie_id
ORDER BY g.genre_name, m.title;

-- Query 5: Cast and director credits for each movie.
SELECT
    m.title,
    a.actor_name,
    ma.character_name,
    ma.cast_order,
    (
        SELECT GROUP_CONCAT(d.director_name ORDER BY d.director_name SEPARATOR ', ')
        FROM MovieDirector AS md
        JOIN Directors AS d ON md.director_id = d.director_id
        WHERE md.movie_id = m.movie_id
    ) AS directors
FROM Movies AS m
JOIN MovieActor AS ma ON m.movie_id = ma.movie_id
JOIN Actors AS a ON ma.actor_id = a.actor_id
ORDER BY m.title, ma.cast_order;

-- Query 6: Number of movies associated with each studio.
SELECT
    s.studio_name,
    COUNT(ms.movie_id) AS movie_count
FROM Studios AS s
LEFT JOIN MovieStudio AS ms ON s.studio_id = ms.studio_id
GROUP BY s.studio_id, s.studio_name
ORDER BY movie_count DESC, s.studio_name;

-- Query 7: All reviews for a movie (change 101 to another movie ID).
SELECT
    m.title,
    u.username,
    r.rating,
    r.review,
    r.rating_date
FROM Ratings AS r
JOIN Movies AS m ON r.movie_id = m.movie_id
JOIN Users AS u ON r.user_id = u.user_id
WHERE m.movie_id = 101
ORDER BY r.rating_date DESC, u.username;
