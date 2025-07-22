-- Top 10 Cities with Lowest Average Ratings
SELECT city,COUNT(*) AS total_restaurants,ROUND(AVG(aggregate_rating), 2) AS avg_rating
FROM zomato_india
GROUP BY city
HAVING COUNT(*) > 10  -- Only consider cities with decent number of restaurants
ORDER BY avg_rating ASC
LIMIT 10;

-- Compare Online Delivery vs Ratings (City Level)
SELECT city,ROUND(AVG(CASE WHEN has_online_delivery = 1 THEN aggregate_rating ELSE NULL END), 2) AS avg_rating_online_delivery,ROUND(AVG(CASE WHEN has_online_delivery = 0 THEN aggregate_rating ELSE NULL END), 2) AS avg_rating_no_delivery
FROM zomato_india
GROUP BY city
ORDER BY avg_rating_online_delivery ASC
LIMIT 10;

-- Cuisines Associated with Low ratings
SELECT cuisines,COUNT(*) AS count,ROUND(AVG(aggregate_rating), 2) AS avg_rating
FROM zomato_india
GROUP BY cuisines
HAVING COUNT(*) > 20
ORDER BY avg_rating ASC
LIMIT 10;

-- Impact of price range on ratings
SELECT price_range,COUNT(*) AS count,ROUND(AVG(aggregate_rating), 2) AS avg_rating
FROM zomato_india
GROUP BY price_range
ORDER BY price_range;

-- Cities with high online deliveries but still low ratings
SELECT city,ROUND(AVG(has_online_delivery)*100, 2) AS pct_online_delivery,ROUND(AVG(aggregate_rating), 2) AS avg_rating
FROM zomato_india
GROUP BY city
HAVING pct_online_delivery > 70 AND avg_rating < 3.5
ORDER BY avg_rating ASC;

-- 1

SELECT city, cuisines, COUNT(*) AS num_restaurants, ROUND(AVG(aggregate_rating), 2) AS avg_rating
FROM zomato_india WHERE city IN ('Ghaziabad', 'Faridabad', 'Noida', 'New Delhi', 'Gurgaon', 
               'Aurangabad', 'Allahabad', 'Ranchi', 'Patna', 'Varanasi')
GROUP BY city, cuisines
ORDER BY city, avg_rating;

-- 2
SELECT 
    city,
    SUM(CASE WHEN has_online_delivery = 1 THEN 1 ELSE 0 END) AS with_online_delivery,
    COUNT(*) AS total_restaurants,
    ROUND(SUM(CASE WHEN has_online_delivery = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS online_delivery_percent
FROM zomato_india
WHERE city IN ('Ghaziabad', 'Faridabad', 'Noida', 'New Delhi', 'Gurgaon', 
               'Aurangabad', 'Allahabad', 'Ranchi', 'Patna', 'Varanasi')
GROUP BY city;


-- 3
SELECT 
    city, 
    price_range,
    ROUND(AVG(aggregate_rating), 2) AS avg_rating, 
    COUNT(*) AS restaurant_count
FROM zomato_india
WHERE city IN ('Ghaziabad', 'Faridabad', 'Noida', 'New Delhi', 'Gurgaon', 
               'Aurangabad', 'Allahabad', 'Ranchi', 'Patna', 'Varanasi')
GROUP BY city, price_range
ORDER BY city, price_range;

-- 4
SELECT 
    city, 
    ROUND(AVG(votes), 2) AS avg_votes
FROM zomato_india
WHERE city IN ('Ghaziabad', 'Faridabad', 'Noida', 'New Delhi', 'Gurgaon', 
               'Aurangabad', 'Allahabad', 'Ranchi', 'Patna', 'Varanasi')
GROUP BY city
ORDER BY avg_votes;



































