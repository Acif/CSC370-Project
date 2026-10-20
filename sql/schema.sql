CREATE DATABASE IF NOT EXISTS movie_rating_system;
USE movie_rating_system;

-- Create the Movies table.
-- Stores movie metadata imported from the dataset.

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    overview TEXT,
    release_date DATE,
    runtime DECIMAL(6,1),
    budget BIGINT,
    revenue BIGINT,
    rating_average DECIMAL(3,1),
    rating_count INT,

    CHECK (runtime IS NULL OR runtime >= 0),
    CHECK (budget IS NULL OR budget >= 0),
    CHECK (revenue IS NULL OR revenue >= 0),
    CHECK (rating_average IS NULL
           OR (rating_average >= 1.0 AND rating_average <= 5.0)),
    CHECK (rating_count IS NULL OR rating_count >= 0)
);

-- Create the Genres table.
-- Stores each genre once.

CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

-- Create the MovieGenre table.
-- This is a many-to-many relationship table that links movies to genres.

CREATE TABLE MovieGenre(
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,

    PRIMARY KEY (movie_id, genre_id),

    FOREIGN KEY (movie_id) 
        REFERENCES Movies(movie_id),

    FOREIGN KEY (genre_id) 
        REFERENCES Genres(genre_id)
);

-- Create the Users table.
-- Stores account information for users of the movie rating system.

CREATE TABLE Users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    date_created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP

);


-- Create the Ratings table.
-- Represents a user's rating of a movie.
-- A user can rate a movie only once.

CREATE TABLE Ratings(

    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    review TEXT,
    rating_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,


    PRIMARY KEY (user_id, movie_id),

    FOREIGN KEY (user_id) 
        REFERENCES Users(user_id),

    FOREIGN KEY (movie_id) 
        REFERENCES Movies(movie_id),

    CHECK (rating >=1.0 AND rating <= 5.0)
);

-- Actors and their movie appearances (from credits.csv cast entries).
CREATE TABLE Actors (
    actor_id INT PRIMARY KEY,
    actor_name VARCHAR(255) NOT NULL
);

CREATE TABLE MovieActor (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    credit_id VARCHAR(100) NOT NULL,
    character_name VARCHAR(255),
    cast_order INT,
    PRIMARY KEY (credit_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id) ON DELETE CASCADE,
    CHECK (cast_order IS NULL OR cast_order >= 0)
);

-- Directors and their movie credits (from credits.csv crew entries).
CREATE TABLE Directors (
    director_id INT PRIMARY KEY,
    director_name VARCHAR(255) NOT NULL
);

CREATE TABLE MovieDirector (
    movie_id INT NOT NULL,
    director_id INT NOT NULL,
    credit_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (credit_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (director_id) REFERENCES Directors(director_id) ON DELETE CASCADE
);

-- Studios are production companies from movies_metadata.csv.
CREATE TABLE Studios (
    studio_id INT PRIMARY KEY,
    studio_name VARCHAR(255) NOT NULL
);

CREATE TABLE MovieStudio (
    movie_id INT NOT NULL,
    studio_id INT NOT NULL,
    PRIMARY KEY (movie_id, studio_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (studio_id) REFERENCES Studios(studio_id) ON DELETE CASCADE
);
