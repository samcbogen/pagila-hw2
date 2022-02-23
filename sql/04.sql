/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

select f.title
from film f
inner join inventory i on f.film_id = i.film_id
inner join rental r on r.inventory_id = i.inventory_id
where r.customer_id = 1
group by f.title
having count(r.customer_id) > 1
order by title;
