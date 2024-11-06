-- Top 5 movies by average rating
SELECT m.title, AVG(r.rating) AS avg_rating
FROM public.movie m
JOIN public.rating r ON m."movieId" = r."movieId"
GROUP BY m.title
ORDER BY avg_rating DESC
LIMIT 5;

-- Average rating per movie
SELECT m.title, AVG(r.rating) AS avg_rating
FROM public.movie m
LEFT JOIN public.rating r ON m."movieId" = r."movieId"
GROUP BY m.title
ORDER BY avg_rating DESC;

-- Movies in a specific genre (Comedy in my case)
SELECT m.title, m.genres
FROM public.movie m
WHERE m.genres = 'Comedy';

-- The most active users (users with the highest number of ratings)
SELECT r."userId", COUNT(r."rating") AS num_ratings
FROM public.rating r
GROUP BY r."userId"
ORDER BY num_ratings DESC
LIMIT 10;