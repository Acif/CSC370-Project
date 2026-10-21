# Database Normalization

The Movie Rating System relational schema was designed to satisfy
Boyce-Codd Normal Form (BCNF).

## Functional Dependencies

### Movies

Primary key: `movie_id`

`movie_id -> title, overview, release_date, runtime, budget, revenue,
rating_average, rating_count`

The determinant is a candidate key; therefore Movies satisfies BCNF.

### Genres

Candidate keys: `genre_id`, `genre_name`

`genre_id -> genre_name`

`genre_name -> genre_id`

Both determinants are candidate keys; therefore Genres satisfies BCNF.

### MovieGenre

Primary key: (`movie_id`, `genre_id`)

MovieGenre contains no non-key attributes. Neither movie_id nor genre_id
alone determines the other because Movies and Genres have a many-to-many
relationship.

Therefore MovieGenre satisfies BCNF.

### Users

Candidate keys: `user_id`, `username`, `email`

Each candidate key determines all other attributes in the relation.
All identified determinants are candidate keys; therefore Users
satisfies BCNF.

### Ratings

Primary key: (`user_id`, `movie_id`)

`(user_id, movie_id) -> rating, review, rating_date`

Neither user_id nor movie_id alone determines the non-key attributes.
The determinant is the candidate key; therefore Ratings satisfies BCNF.

### Actors

Primary key: `actor_id`

`actor_id -> actor_name`

The determinant is a candidate key; therefore Actors satisfies BCNF.

### MovieActor

Primary key: `credit_id`

`credit_id -> movie_id, actor_id, character_name, cast_order`

The credit ID uniquely identifies an actor appearance. Under this
assumption, the determinant is a candidate key; therefore MovieActor
satisfies BCNF.

### Directors

Primary key: `director_id`

`director_id -> director_name`

The determinant is a candidate key; therefore Directors satisfies BCNF.

### MovieDirector

Primary key: `credit_id`

`credit_id -> movie_id, director_id`

The credit ID uniquely identifies a director credit. Under this
assumption, the determinant is a candidate key; therefore MovieDirector
satisfies BCNF.

### Studios

Primary key: `studio_id`

`studio_id -> studio_name`

The determinant is a candidate key; therefore Studios satisfies BCNF.

### MovieStudio

Primary key: (`movie_id`, `studio_id`)

MovieStudio contains no non-key attributes. Neither movie_id nor
studio_id alone determines the other because movies and studios have
a many-to-many relationship.

Therefore MovieStudio satisfies BCNF.

## Normal Form Summary

The relations satisfy First Normal Form because attributes contain atomic
values and repeating or multivalued data, such as movie genres and movie credits, is stored
in separate relations.

The relations with composite keys do not contain partial dependencies, so
the schema satisfies Second Normal Form.

Non-key attributes do not determine other non-key attributes, avoiding
transitive dependencies and satisfying Third Normal Form.

Finally, every identified non-trivial functional dependency has a
superkey as its determinant. Therefore, under the specified functional
dependencies, the relational schema satisfies BCNF.