
--Nama Lengkap : Lukman

--1
SELECT mov_title as movie_title FROM movie WHERE mov_title LIKE 'The%'

--2
SELECT dir_fname || ' ' || dir_lname AS director_name, mov_title as movie_title FROM movie 
    INNER JOIN movie_direction ON movie.mov_id = movie_direction.mov_id 
    INNER JOIN director ON movie_direction.dir_id = director.dir_id 
        WHERE director.dir_fname='James' AND director.dir_lname = 'Cameron'
        
--3
SELECT DISTINCT(act_fname)  AS names
FROM actor
UNION 
SELECT DISTINCT(dir_fname)  AS names
FROM director  ORDER BY names ASC;

--4
SELECT genres.gen_title, COUNT(genres.gen_id) FROM movie 
    INNER JOIN movie_genres ON movie_genres.mov_id = movie.mov_id 
    INNER JOIN genres ON movie_genres.gen_id = movie_genres.gen_id
        WHERE genres.gen_title IN ('Mystery', 'Drama', 'Adventure') 
            GROUP BY genres.gen_title
            
--5
SELECT
    CASE
        WHEN mov_time < 100 THEN 'short movie'
        WHEN mov_time > 130 THEN 'long movie'
        ELSE 'normal movie'
    END AS label_duration,
    COUNT(*) AS number_of_movies
FROM
    movie
GROUP BY
    label_duration;     