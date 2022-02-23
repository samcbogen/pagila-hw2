/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

select distinct(title) from film f
inner join inventory i on f.film_id = i.film_id
where f.film_id not in (
    select film_id from inventory i
    inner join rental r on i.inventory_id = r.inventory_id
    inner join customer cu on cu.customer_id = r.customer_id
    inner join address a on a.address_id = cu.address_id
    inner join city ci on ci.city_id = a.city_id
    inner join country co on co.country_id = ci.country_id
    where co.country = 'United States'
)
order by title;
