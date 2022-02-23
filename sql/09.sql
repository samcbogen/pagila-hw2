/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

select special_feature as special_features, count
from
(
    select unnest(special_features) as special_feature, count(*)
    from film group by special_feature
) t
order by special_feature;
