select *
FROM netflix limit 5;


Q1. Total number of titles

select count(*) as total_titles
from netflix;

Q2. Count of Movies vs TV Shows

select type, count(*) as total
from netflix
group by type;

Q3. Number of unique countries

select count(distinct(country)) as unique_countries
from netflix;

Q4. Number of unique directors

select count(distinct (director)) as unique_directors
from netflix;

Q5. Number of unique ratings

select count(distinct(rating)) as unique_ratings
from netflix;

Q6. Top 10 countries by content count

select country , count(*) as total_titles
from netflix
where country is not null
group by country
order by total_titles desc
limit 10;


Q7. Top 10 directors

select director, count(*) as total_titles
from netflix
where director is not null
group by director
order by total_titles desc
limit 10;


Q8. Top genres

select listed_in , count(*) as total_titles
from netflix
group by listed_in
order by total_titles desc
limit 10;


Q9. Rating distribution

select rating , count(*) as total_titles
from netflix
group by rating
order by total_titles desc;


Q10. Content added each year

select year_added, count(*) as total_titles
from netflix
group by year_added
order by year_added;

Q11. Content added each month

select month_added, count(*) as total_titles
from netflix
group by month_added
order by total_titles desc;


Q12. Number of titles by release year

select release_year, count(*) as total_titles
from netflix
group by release_year
order by release_year desc;

Q13. Latest 20 releases

select title, release_year
from netflix
order by release_year desc
limit 20;


Q14. Titles released after 2020

select title, type,release_year
from netflix
where release_year > 2020;


Q15. Average movie duration


SELECT ROUND(AVG(duration_num)::numeric, 2) AS avg_duration
FROM netflix
WHERE type = 'Movie';


Q16. Top 10 longest movies

SELECT title, duration_num
FROM netflix
WHERE type = 'Movie'
ORDER BY duration_num DESC
LIMIT 10;


Q17. TV Shows with the most seasons

SELECT title, duration_num
FROM netflix
WHERE type = 'TV Show'
ORDER BY duration_num DESC
LIMIT 10;


Q18. Movies with a PG-13 rating

select title
from netflix
where rating = 'PG-13';


Q19. Count of titles by content rating

select rating, count(*)as total from netflix
group by rating
order by total desc;


Q20. Count of Movies and TV Shows for each country

select country, type, count(*)as total 
from netflix
group by country,type
order by country;


Q21. Rank countries by number of titles


SELECT country,
       COUNT(*) AS total_titles,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS country_rank
FROM netflix
GROUP BY country;

Q22. Running total of content added by year

SELECT year_added,
       COUNT(*) AS yearly_titles,
       SUM(COUNT(*)) OVER (ORDER BY year_added) AS cumulative_total
FROM netflix
GROUP BY year_added
ORDER BY year_added;


Q23. Top-rated category by number of titles

SELECT rating,
       COUNT(*) AS total_titles
FROM netflix
GROUP BY rating
ORDER BY total_titles DESC
LIMIT 1;

Q24. Percentage of Movies vs TV Shows

SELECT
    type,
    COUNT(*) AS total,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM netflix),
        2
    ) AS percentage
FROM netflix
GROUP BY type;

Q25. Top 5 release years with the most content

SELECT release_year,
       COUNT(*) AS total_titles
FROM netflix
GROUP BY release_year
ORDER BY total_titles DESC
LIMIT 5;

