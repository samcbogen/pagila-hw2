/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

select distinct ("Actor Name") from 
(
    select unnest(special_features) as special_feature, first_name || ' ' || last_name as "Actor Name"
    from film f
    inner join film_actor fa on f.film_id = fa.film_id
    inner join actor a on fa.actor_id = a.actor_id
) t
where special_feature = 'Behind the Scenes' order by "Actor Name";
