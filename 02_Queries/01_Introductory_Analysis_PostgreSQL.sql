-- Analyze the rental duration distribution: How many days are most films rented for?
SELECT rental_duration AS "Rented for (in days)", 
       COUNT(*) AS "Number of films"
FROM film
GROUP BY rental_duration
ORDER BY COUNT(*) DESC;

Answer: Most films are rented for 6 days. 

-- Retrieve all film genres from the category table, including category ID.
SELECT category_id, name AS genre
FROM category
ORDER BY category_id;

-- Write an INSERT statement to add the following genres to the category table: Thriller, Crime, Mystery, Romance, and War.

INSERT INTO category (genre)
VALUES ('Thriller'),('Crime'),('Mystery'), ('Romance'), ('War'); 

-- The genre for the movie African Egg needs to be updated to thriller (assuming it is category_id = 17).
SELECT category_id, name AS genre
FROM category
WHERE name = 'Thriller';

-- Find the film ID of "African Egg".
SELECT film_id
FROM film
WHERE title = 'African Egg';

-- Update the genre of "African Egg" to 'Thriller'.
UPDATE film_category
SET category_id = 17
WHERE film_id = 5;

-- Run a query that selects every film from the “film” table, with the movies sorted by title from A to Z, then by most recent release year, and then by highest to lowest rental rate. 
SELECT title, release_year, rental_rate 
FROM film
ORDER BY title ASC, 
release_year DESC, rental_rate DESC;

-- Custom order query. What are the minimum and the maximum replacement costs for each rating category ordered by rating as follows: G, PG, PG-13, R, NC-17?
SELECT rating, 
       MIN(replacement_cost) AS min_replacement_cost, 
       MAX(replacement_cost) AS max_replacement_cost
FROM film
GROUP BY rating
ORDER BY CASE  
            WHEN rating = 'G' THEN 1
            WHEN rating = 'PG' THEN 2
            WHEN rating = 'PG-13' THEN 3
            WHEN rating = 'R' THEN 4
            WHEN rating = 'NC-17' THEN 5
			ELSE 6
         END;

### Output Minimum & Maximum Replacement Costs by Rating  

| Rating  | Min Replacement Cost | Max Replacement Cost |
|---------|----------------------|----------------------|
| G       | 9.99                 | 29.99               |
| PG      | 9.99                 | 29.99               |
| PG-13   | 9.99                 | 29.99               |
| R       | 9.99                 | 29.99               |
| NC-17   | 9.99                 | 29.99               |


-- Filter film titles that contain the word 'Uptown' in an position. 
SELECT film_id, title, description 
FROM film 
WHERE title LIKE '%Uptown%';

-- Filter film titles where rental duration is between 3 and 7 days (where 3 and 7 aren’t inclusive).
SELECT film_id, title, description, rental_duration
FROM film 
WHERE rental_duration>3 AND rental_duration<7;

-- Filter film titles where rating is either PG or G.
SELECT film_id, title, description, rating
FROM film 
WHERE rating IN ('PG', 'G');

