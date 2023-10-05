use sakila;
-- 1) Clientes dentro de city_id = 312
SELECT c.first_name, c.last_name, c.email, a.address
FROM customer c
JOIN address a ON c.address_id = a.address_id
WHERE a.city_id = 312;
-- 2) Películas de comedia
SELECT f.title, f.description, f.release_year, f.rating, f.special_features, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Comedy';
-- 3) Películas unidas por actor_id = 5
SELECT fa.actor_id, a.first_name, a.last_name, f.title, f.description, f.release_year
FROM film_actor fa
JOIN actor a ON fa.actor_id = a.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE fa.actor_id = 5;
-- 4) Clientes en store_id = 1 y en ciudades (1, 42, 312, 459)
SELECT c.first_name, c.last_name, c.email, a.address
FROM customer c
JOIN address a ON c.address_id = a.address_id
WHERE c.store_id = 1 AND a.city_id IN (1, 42, 312, 459);
-- 5) Películas con "calificación = G" y "característica especial = detrás de escena" unidas por actor_id = 15
SELECT f.title, f.description, f.release_year, f.rating, f.special_features, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN film_actor fa ON f.film_id = fa.film_id
WHERE f.rating = 'G' AND f.special_features LIKE '%Behind the Scenes%' AND fa.actor_id = 15;
-- 6) Actores que se unieron en film_id = 369
SELECT fa.film_id, f.title, fa.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name
FROM film_actor fa
JOIN actor a ON fa.actor_id = a.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE fa.film_id = 369;
-- 7) Películas dramáticas con tarifa de alquiler de 2.99
SELECT f.title, f.description, f.release_year, f.rating, f.special_features, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Drama' AND f.rental_rate = 2.99;
-- 8) Películas de acción a las que se une SANDRA KILMER
SELECT f.title, f.description, f.release_year, f.rating, f.special_features, c.name AS category, CONCAT(a.first_name, ' ', a.last_name) AS actor_name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE c.name = 'Action' AND (a.first_name = 'SANDRA' AND a.last_name = 'KILMER');