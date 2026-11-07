-- Fictional sample data for Movie Rating System.
-- Run after schema.sql against an empty database.
USE movie_rating_system;

INSERT INTO Movies (movie_id, title, overview, release_date, runtime, budget, revenue, source_rating_average, source_rating_count) VALUES
(101, 'The Last Signal', 'A researcher discovers a mysterious transmission.', '2021-04-16', 118.0, 25000000, 76000000, 4.2, 1500),
(102, 'Midnight Harbor', 'A detective investigates disappearances in a coastal town.', '2020-10-09', 105.0, 12000000, 31000000, 3.8, 840),
(103, 'Orbit Seven', 'A crew attempts to repair a distant space station.', '2023-07-21', 132.0, 80000000, 210000000, 4.5, 3200),
(104, 'A Summer Recipe', 'Two siblings reopen a family restaurant.', '2019-06-14', 96.0, 5000000, 19000000, 3.6, 430),
(105, 'The Silent Forest', 'A documentary follows wildlife conservation efforts.', '2024-03-08', 88.0, 2000000, 6500000, 4.0, 210),
(106, 'Glass City', 'An architect uncovers a hidden history.', '2022-11-18', 111.0, 18000000, 47000000, 3.9, 980);

INSERT INTO Genres (genre_id, genre_name) VALUES
(1, 'Science Fiction'), (2, 'Drama'), (3, 'Mystery'), (4, 'Comedy'), (5, 'Documentary');

INSERT INTO MovieGenre (movie_id, genre_id) VALUES
(101, 1), (101, 3), (102, 2), (102, 3), (103, 1), (103, 2),
(104, 2), (104, 4), (105, 5), (106, 2), (106, 3);


INSERT INTO Users (user_id, username, password, email) VALUES
(1, 'demo_alex', 'DEMO_NOT_A_PASSWORD', 'alex@example.invalid'),
(2, 'demo_sam', 'DEMO_NOT_A_PASSWORD', 'sam@example.invalid'),
(3, 'demo_taylor', 'DEMO_NOT_A_PASSWORD', 'taylor@example.invalid'),
(4, 'demo_jordan', 'DEMO_NOT_A_PASSWORD', 'jordan@example.invalid');

INSERT INTO Ratings (user_id, movie_id, rating, review) VALUES
(1, 101, 4.5, 'Interesting mystery and strong ending.'),
(2, 101, 4.0, 'Enjoyed the atmosphere.'),
(3, 101, 5.0, 'My favourite of the group.'),
(1, 102, 3.5, 'Good performances.'),
(4, 102, 4.0, 'Kept me guessing.'),
(1, 103, 5.0, 'Excellent space adventure.'),
(2, 103, 4.5, 'Great visuals.'),
(3, 103, 4.5, 'Would watch again.'),
(4, 103, 5.0, 'Very entertaining.'),
(2, 104, 3.0, 'A pleasant comedy.'),
(3, 104, 4.0, 'Warm and funny.'),
(4, 105, 4.5, 'Informative and moving.');
-- Movie 106 intentionally has no user ratings.

INSERT INTO Actors (actor_id, actor_name) VALUES
(201, 'Avery Morgan'), (202, 'Riley Chen'), (203, 'Casey Patel'),
(204, 'Jamie Brooks'), (205, 'Morgan Ellis'), (206, 'Drew Parker');

INSERT INTO MovieActor (movie_id, actor_id, credit_id, character_name, cast_order) VALUES
(101, 201, 'cast-101-201', 'Dr. Rowan', 0),
(101, 202, 'cast-101-202', 'Mira', 1),
(102, 203, 'cast-102-203', 'Detective Vale', 0),
(102, 202, 'cast-102-202', 'Nora', 1),
(103, 201, 'cast-103-201', 'Commander Hale', 0),
(103, 204, 'cast-103-204', 'Engineer Lee', 1),
(104, 205, 'cast-104-205', 'Alex', 0),
(104, 206, 'cast-104-206', 'Taylor', 1),
(105, 204, 'cast-105-204', 'Narrator', 0),
(106, 203, 'cast-106-203', 'Morgan', 0);

INSERT INTO Directors (director_id, director_name) VALUES
(301, 'Quinn Rivera'), (302, 'Harper Blake'), (303, 'Riley Chen'), (304, 'Devon Reed');

INSERT INTO MovieDirector (movie_id, director_id, credit_id) VALUES
(101, 301, 'dir-101-301'),
(102, 302, 'dir-102-302'),
(103, 301, 'dir-103-301'),
(104, 303, 'dir-104-303'),
(105, 304, 'dir-105-304'),
(106, 302, 'dir-106-302');
-- Riley Chen also appears in Actors, illustrating the separate-entity design.

INSERT INTO Studios (studio_id, studio_name) VALUES
(401, 'Northlight Pictures'), (402, 'Blue Horizon Studios'), (403, 'Cedar Films');

INSERT INTO MovieStudio (movie_id, studio_id) VALUES
(101, 401), (101, 402), (102, 403), (103, 401), (103, 402),
(104, 403), (105, 402), (106, 401);
