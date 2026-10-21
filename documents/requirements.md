# Movie Rating System Requirements

## 1. Movies

- R1: The system shall store information about movies.
- R2: Each movie shall be uniquely identified by a movie ID.
- R3: A movie shall have a title.
- R4: A movie may contain an overview, release date, runtime, budget,
  revenue, source rating average, and source rating count.
- R5: Source rating information imported with movie metadata shall remain
  separate from ratings submitted by users of this system.

## 2. Genres

- R6: The system shall store movie genres.
- R7: Each genre shall be uniquely identified by a genre ID.
- R8: Each genre shall have a unique name.
- R9: A movie may belong to multiple genres.
- R10: A genre may be associated with multiple movies.

## 3. Users

- R11: The system shall store registered users.
- R12: Each user shall be uniquely identified by a user ID.
- R13: Each user shall have a unique username.
- R14: Each user shall have a unique email address.
- R15: The system shall store a password for each user.
- R16: The system shall record when a user account was created.

## 4. Ratings and Reviews

- R17: A user may rate movies stored in the system.
- R18: A movie may receive ratings from multiple users.
- R19: A user may rate a particular movie at most once.
- R20: User ratings shall be between 1.0 and 5.0.
- R21: A user may optionally include a written review with their rating.
- R22: The system shall record when a rating was submitted.
- R23: A rating must reference an existing user.
- R24: A rating must reference an existing movie.

## 5. Rating Statistics

- R25: The system shall be able to calculate the average user rating
  for a movie from ratings submitted by users.
- R26: The system shall be able to determine the number of user ratings
  submitted for a movie.

## 6. Actors

- R27: The system shall store actors.
- R28: Each actor shall be uniquely identified by an actor ID.
- R29: Each actor shall have a name.
- R30: A movie may feature multiple actors.
- R31: An actor may appear in multiple movies.
- R32: Each actor appearance shall have a unique credit ID and may include
  a character name and cast order.

## 7. Directors

- R33: The system shall store directors.
- R34: Each director shall be uniquely identified by a director ID.
- R35: Each director shall have a name.
- R36: A movie may have multiple directors.
- R37: A director may direct multiple movies.
- R38: Each director credit shall have a unique credit ID.

## 8. Studios

- R39: The system shall store studios representing production companies.
- R40: Each studio shall be uniquely identified by a studio ID.
- R41: Each studio shall have a name.
- R42: A movie may be associated with multiple studios.
- R43: A studio may be associated with multiple movies.

## 9. Rating Calculation

- R44: Imported movie rating averages shall be converted from the source
  0.0–10.0 scale to a 0.0–5.0 scale before storage.
- R45: Average ratings and rating counts submitted by system users shall
  be calculated using SQL aggregation rather than stored as copies of
  the imported movie rating statistics.
- R46: Movies without user-submitted ratings shall have a calculated
  user rating count of zero and a NULL user rating average.
