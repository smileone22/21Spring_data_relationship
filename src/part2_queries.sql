--1. Show the possible values of the year column in the country_stats table sorted by most recent year first.
--only show years
--sort by year descending

SELECT DISTINCT year FROM country_stats
ORDER BY year DESC;

-- 2. Show the names of the first 5 countries in the database when sorted in alphabetical order by name.
-- only show country names
-- sort results in alphabetical order

SELECT  name FROM countries
ORDER BY name limit 5;

-- 3. Adjust the previous query to show both the country name and the gdp from 2018, 
-- but this time show the top 5 countries by gdp.

SELECT name ,cs.gdp FROM countries 
INNER JOIN country_stats cs on countries.country_id = cs.country_id
WHERE cs.year=2018
ORDER BY gdp desc 
limit 5;

-- 4. How many countries are associated with each region id?
-- show both the region id and count
-- label the count column country_count
-- order the report by the country_count descending

SELECT region_id, count(countries) as country_count 
FROM countries
GROUP BY region_id
ORDER BY country_count desc;

-- 5. What is the average area of countries in each region id?
-- only show the region id and average area (labelled as avg_area) of countries in that region
-- round the result to the nearest whole number
-- sort from least to greatest avg_area

SELECT region_id, round(avg(area)) as avg_area
FROM countries
GROUP BY region_id
ORDER BY avg_area;

-- 6. Use the same query as above, 
-- but only show the groups with an average country area less than 1000
-- use HAVING to do this

SELECT region_id, round(avg(area)) as avg_area
FROM countries
GROUP BY region_id
HAVING round(avg(area)) <1000
ORDER BY avg_area;


-- 7. Create a report displaying the name and population of every continent 
-- in the database from the year 2018 in millions.
-- show only name and total population (in a field called tot_pop)
-- sort from greatest tot_pop to least tot_pop


SELECT  cnt.name, round(sum(tmp.pop)/1000000,2) as tot_pop
from regions rg 
INNER JOIN (SELECT ct.region_id, sum(cs.population) as pop
FROM countries ct INNER JOIN country_stats cs ON cs.country_id= ct.country_id WHERE cs.year=2018
GROUP BY ct.region_id ) AS tmp ON rg.region_id = tmp.region_id
INNER JOIN continents cnt ON cnt.continent_id=rg.continent_id
GROUP BY cnt.name
ORDER BY tot_pop DESC;




-- 8. List the names of all of the countries that do not have a language.
SELECT name
FROM countries ct
LEFT JOIN country_languages cl on ct.country_id=cl.country_id
WHERE cl.language_id IS NULL;

-- 9. Show the country name and number of associated languages of the top 10 countries with most languages
-- only display the name of the country and the count (name this field lang_count)
-- sort by most languages to least languages
-- only show the top 10

SELECT countries.name, tmp.lang_count 
FROM countries
INNER JOIN (SELECT cl.country_id , count(language_id) AS lang_count
FROM country_languages cl 
INNER JOIN countries ct ON cl.country_id = ct.country_id
GROUP BY cl.country_id) AS tmp ON tmp.country_id= countries.country_id
ORDER by tmp.lang_count DESC, countries.name ASC 
LIMIT 10; 

-- 10. Repeat your previous query, but display a comma separated list of spoken languages rather than a count (use the aggregate function for strings, string_agg. 
-- A single example row (note that results before and above have been omitted for formatting):
-- no alias is required for the string aggregation function

SELECT countries.name, list
FROM countries
INNER JOIN (SELECT cl.country_id , STRING_AGG(lg.language,', ') as list
FROM country_languages cl 
INNER JOIN countries ct ON cl.country_id = ct.country_id
INNER JOIN languages lg on lg.language_id=cl.language_id
GROUP BY cl.country_id) AS tmp ON tmp.country_id= countries.country_id;

-- 11. What's the average number of languages in every country in a region in the dataset? 
-- Show both the region's name and the average. 
-- Make sure to include countries that don't have a language in your calculations. 
-- (Hint: using your previous queries and additional subqueries may be useful)
-- only include name and average (as a field called avg_lang_count_per_country)
-- at most, avg_lang_count_per_country should have one decimal place
-- sort by greatest avg_lang_count_per_country to least avg_lang_count_per_country

SELECT rg.name, round(avg(tmp.counting),1) as avg_lang_count_per_country
FROM regions rg 
INNER JOIN (
SELECT cnt.country_id, cnt.region_id, COALESCE(COUNT(cl.language_id),0) as counting
FROM country_languages cl
RIGHT JOIN countries cnt on cl.country_id=cnt.country_id
group by cnt.country_id
) tmp on tmp.region_id = rg.region_id
GROUP BY rg.region_id 
ORDER BY avg_lang_count_per_country DESC;



-- 12. Show the country name and its "national day" 
-- for the country with the most recent national day and 
-- the country with the oldest national day. 
-- Do this with a single query. 
-- (Hint: both subqueries and UNION may be helpful here). 

(SELECT name, national_day 
FROM countries 
WHERE national_day IS NOT NULL
ORDER BY national_day DESC
LIMIT 1)
UNION
(SELECT name, national_day 
FROM countries 
WHERE national_day IS NOT NULL
ORDER BY national_day 
LIMIT 1);