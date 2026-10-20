# Uvic CSC 370, Fall 2026
## Project: Movie Rating System


# Movie Rating System — Project Task List

## Priority 1 — Address instructor feedback

- [X] **Expand the schema from 5 tables to at least 8.** 
  Implemented 11 tables:
  - Movies, Genres, MovieGenre
  - Users, Ratings
  - Actors, MovieActor
  - Directors, MovieDirector
  - Studios, MovieStudio

- [X] **Make movie vote fields consistent everywhere.**

- [ ] **Document the two rating scales.** Source movie votes are on a 0–10 scale; individual system ratings are 1–5. Explain that source aggregates are not computed from this system's `Ratings` rows. Derive system averages and counts using `AVG()` and `COUNT()` queries instead of storing redundant copies.
- [ ] **Fix the conceptual ERD.** Remove arrowheads from attribute-to-entity lines. Put relationship arrows only where cardinality requires them, following the instructor's notation. Keep the conceptual M:N `RATES` and `BELONGS TO` relationships clear, and revise the diagram when new entities are agreed upon.
- [ ] **Specify foreign-key deletion rules.** Decide per relationship whether `ON DELETE RESTRICT`, `CASCADE`, or another action matches the business requirements; explicitly document the rationale. Consider cascade for junction rows only after discussing whether deleting a movie/user should delete associated ratings.

## Priority 2 — Keep implementation and documentation aligned

- [ ] **Separate schema setup from data loading.** Keep table creation in `sql/schema.sql`; move `LOAD DATA LOCAL INFILE` statements into a separate import script (for example, `sql/import_data.sql`). This makes DDL reproducible without local CSVs.
- [ ] **Remove machine-specific import paths.** Current script uses `/Users/morgs/Documents/...`. Document how each teammate should configure paths and `LOCAL INFILE`, and use portable paths or configurable instructions where possible. Avoid relying on `SET GLOBAL local_infile=ON` without discussing required privileges and security.
- [ ] **Verify CSV imports on the actual cleaned files.** Check column order, line endings (`\r\n` vs `\n`), date formats, missing values, numeric conversion, duplicate IDs, and foreign-key coverage. Record row counts and import errors.
- [ ] **Update the database-design README.** Add descriptions, attributes, candidate keys, cardinalities, and foreign keys for each new table. Correct `generes` to `genres` in the overview. Keep the nested README as the folder's landing page.
- [ ] **Update `norm.md` for every new relation.** List candidate keys and nontrivial functional dependencies, then verify BCNF under the stated business rules. Revisit any dependency assumptions changed by the new design.
- [ ] **Update requirements to reflect the agreed scope.** Add requirements for the new entities and explicit deletion behavior. Ensure each requirement is traceable to a table, constraint, relationship, or query.

## Priority 3 — Implement and demonstrate functionality

- [ ] **Create sample data or load a representative dataset subset.** Include movies, genres, users, ratings, and all new relations. Keep test data small enough for predictable demonstrations.
- [ ] **Implement rating aggregation queries.** Show `AVG(rating)` and `COUNT(*)` grouped by movie, including how movies with no ratings are handled.
- [ ] **Implement relationship queries.** Examples: users and their rated movies, movies with their genres, and any new person/cast/crew relationships.
- [ ] **Test integrity constraints.** Confirm rejection of duplicate `(user_id, movie_id)` ratings, invalid 1–5 ratings, missing foreign-key references, duplicate usernames/emails/genre names, and invalid metadata values.
- [ ] **Test `ON DELETE` behavior.** For each foreign key, attempt a deletion and confirm the actual result matches the documented policy.
- [ ] **Capture reproducible demo evidence.** Save commands, expected outcomes, actual outputs, and relevant screenshots/logs. Do not claim tests passed until they have run.

## Priority 4 — Sprint presentation and collaboration

- [ ] **Update the sprint video/slides with the feedback fixes.** Demonstrate the revised ERD, 8+ table schema, updated normalization argument, import process, and representative SQL queries.
- [ ] **Record each member's actual contribution.** Use Git commits, task assignments, and demo responsibilities rather than assigning generic work retroactively.
- [ ] **Report what was completed versus still planned.** Clearly identify any unfinished dataset imports, advanced design decisions, or tests.
- [ ] **Set measurable next-sprint goals.** Specify concrete query/test deliverables, ownership, and evidence required for completion; align with the course's upcoming material.
- [ ] **Review the repository before submission.** Ensure SQL runs in the documented order, diagrams match the final DDL, file names match references, and no local credentials or private paths remain in committed instructions.


