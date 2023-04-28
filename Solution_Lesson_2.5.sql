-- Select all the actors with the first name ‘Scarlett’.
SELECT first_name FROM actor
WHERE first_name = "Scarlett";

 /* How many physical copies of movies are available for rent in the store's inventory? 
How many unique movie titles are available? */
SELECT count(inventory_id) FROM rental WHERE return_date < last_update;


-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT max(length) AS max_duration, min(length) AS min_duration FROM film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT TIME_FORMAT(SEC_TO_TIME(AVG(length * 60)), '%H:%i') AS avg_duration_hh_mm
FROM film;	

-- How many distinct (different) actors' last names are there?
SELECT count(DISTINCT(last_name))FROM actor;

/* How many days was the company operating? Assume the last rental date	 was their closing date. 
(check DATEDIFF() function)*/
SELECT datediff(MAX(RENTAL_DATE), MIN(RENTAL_DATE)) AS operating_days FROM RENTAL;

-- Show rental info with additional columns month and weekday. Get 20 results.
 SELECT rental_id, rental_date, Monthname(rental_date) AS month, 
 dayname(rental_date) AS weekday FROM rental LIMIT 20 ;

 -- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT rental_id, rental_date, monthname(rental_date) AS MONTH,  dayname(rental_date) AS weekday,
 CASE WHEN dayofweek(rental_date) IN (1,7) THEN 'weekend' ELSE 'workday' 
 END AS day_type FROM rental ;
 
 -- Get release years
 SELECT release_year FROM film;
 
 -- Get all films with ARMAGEDDON in the title.
SELECT * FROM film WHERE title LIKE '%ARMAGEDDON';

-- Get all films which title ends with APOLLO
SELECT * FROM film
WHERE title LIKE "%APOLLO";

-- Get 10 the longest films
SELECT * FROM film
ORDER BY length DESC
LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT count(*) FROM film
WHERE special_features LIKE '%behind the scene%';