/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

select distinct(c.customer_id) from film f
inner join inventory i on f.film_id = i.film_id
inner join rental r on r.inventory_id = i.inventory_id
inner join customer c on c.customer_id = r. customer_id
where f.title in
(select f.title
    from film f    
    inner join inventory i on f.film_id = i.film_id
    inner join rental r on r.inventory_id = i.inventory_id
    inner join payment p on r.rental_id = p.rental_id
    group by f.title
    order by sum(p.amount) desc
    limit 5)
order by c.customer_id;
