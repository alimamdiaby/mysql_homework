SELECT first_name, last_name FROM sakila.actor;

SELECT concat(first_name," ", last_name) AS Actor_Name FROM sakila.actor;

SELECT actor_id, first_name, last_name FROM sakila.actor WHERE first_name = "Joe";

SELECT * FROM sakila.actor WHERE last_name LIKE '%GEN%';

SELECT * FROM sakila.actor WHERE last_name like '%LI%' ORDER BY last_name ASC, first_name ASC;

SELECT * FROM sakila.country WHERE country in ('Afghanistan', 'Bangladesh', 'China');

ALTER TABLE sakila.actor ADD COLUMN description BLOB;

ALTER TABLE sakila.actor DROP COLUMN description;

SELECT last_name, COUNT(last_name)from sakila.actor GROUP BY last_name;

SELECT last_name, COUNT(last_name)from sakila.actor GROUP BY last_name HAVING COUNT(last_name) > 1;

SELECT * FROM sakila.actor WHERE last_name='WILLIAMS' and first_name='GROUCHO';

UPDATE sakila.actor SET first_name = 'HARPO' WHERE first_name = 'WILLIAMS' AND first_name ='GROUCHO';

SELECT * FROM sakila.actor WHERE last_name='WILLIAMS' AND first_name = 'HARPO';

UPDATE sakila.actor SET first_name = 'GROUCHO' WHERE first_name = 'HARPO';

SELECT *FROM sakila.actor WHERE last_name= 'WILLIAMS' AND first_name = 'GROUCHO';

SHOW CREATE TABLE sakila.address;

SELECT st.first_name, st.last_name, ad.address FROM sakila.staff st JOIN sakila.address ad ON st.address_id=ad.address_id;

SELECT SUM(pay.amount), st.first_name FROM sakila.payment pay JOIN sakila.staff st ON st.staff_id = pay.staff_id GROUP BY st.staff_id;

SELECT * FROM sakila.film_actor;

SELECT act.film_id, f.title, COUNT( act.film_id) FROM sakila.film_actor act INNER JOIN sakila.film f ON act.film_id GROUP BY film_id;

SELECT count(title ) FROM sakila.film WHERE title= 'Hunchback Impossible';

SELECT c.first_name, c.last_name, sum(pay.amount)FROM sakila.customer c JOIN sakila.payment pay ON c.customer_id =pay.customer_id GROUP BY c.customer_id ORDER BY c.last_name;

SELECT * FROM sakila.payment;

SELECT * FROM sakila.film WHERE title LIKE "Q%" OR title LIKE "K%" AND language_id IN (select language_id FROM sakila.LANGUAGE WHERE name = "English");

SELECT first_name, last_name FROM sakila.actor WHERE actor_id in (select actor_id FROM sakila.film_actor WHERE film_id IN (SELECT film_id FROM sakila.film WHERE title = "Alone Trip"));

SELECT c.first_name, c.last_name, c.email, co.country FROM sakila.customer c INNER JOIN sakila.address ad on c.address_id=ad.address_id INNER JOIN sakila.city ci on ad.city_id=ci.city_id INNER JOIN sakila.country co on ci.country_id=co.country_id WHERE country ="Canada";

SELECT f.title, c.name FROM sakila.film f JOIN sakila .film_category fc USING(film_id) JOIN sakila.category c USING(category_id) WHERE NAME="Family";

SELECT f.title, COUNT(r.inventory_id) FROM sakila.film f join sakila.inventory inv USING(film_id) JOIN sakila.rental r USING(inventory_id) GROUP BY f.title ORDER BY COUNT(r.inventory_id) DESC;

SELECT s.store_id, SUM(p.amount) FROM sakila.store s JOIN sakila.inventory inv USING(store_id) JOIN sakila.rental r USING(inventory_id) JOIN sakila.payment p USING(rental_id) GROUP BY s.store_id;

SELECT s.store_id, c.city, co.country, co.country FROM sakila.store S JOIN sakila.address a USING(address_id) JOIN sakila.city c USING(city_id) JOIN sakila.country co USING(country_id) GROUP BY s.store_id;

SELECT ca.name, SUM(p.amount) FROM sakila.category ca JOIN sakila.film_category fc USING(category_id) JOIN sakila.inventory USING(film_id) JOIN sakila.rental USING(inventory_id) JOIN sakila.payment p USING(rental_id) GROUP BY ca.name ORDER BY SUM(p.amount) DESC LIMIT 5;
CREATE VIEW top_5genres AS
SELECT cat.NAME, sum(pay.amount) from sakila.category cat JOIN sakila.film_category USING(category_id) JOIN sakila.inventory USING(film_id) join sakila.rental using(inventory_id) join sakila.payment pay using(rental_id)
GROUP BY cat.NAME order by sum(pay.amount) DESC LIMIT 5;

SELECT * FROM top_5genres;

DROP VIEW top_5genres;