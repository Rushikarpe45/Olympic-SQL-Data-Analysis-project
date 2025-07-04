drop table if exists olympic;

CREATE TABLE olympic (
    season TEXT,
    year INT,
    medal TEXT,
    country_code TEXT,
    country TEXT,
    athletes TEXT,
    games TEXT,
    sport TEXT,
    event_gender TEXT,
    event_name TEXT
);
select *
from olympic;

--null values
SELECT * 
FROM olympic
WHERE medal IS NULL
   OR season IS NULL
   OR games IS NULL
   OR sport IS NULL
   OR event_gender IS NULL
   OR event_name IS NULL
   OR athletes IS NULL;

--count of rows
select count(*)
from olympic;

----List all unique sports:---

select Distinct  sport
from olympic;


--won the medal win by the india----

select *
from olympic
where  country='India';

--list of the gold medialist---
SELECT * FROM olympic WHERE medal = 'Gold';

---list of the Silver medialist---
SELECT * from olympic_ WHERE medal='Silver';

---list of the Bronze medialist---
SELECT * from olympic WHERE medal='Bronze';


--which country have won the most medal in Olympic Histroy--

Select  country, COUNT(*) AS total_medals
From olympic
Group BY country
Order BY total_medals DESC;


---Top 8 countries by Gold medals---
Select country, COUNT(*) AS golds
From olympic
Where medal = 'Gold'
Group BY country
Order BY golds DESC
LIMIT 8;


---Medals won by India in each year---


Select year, COUNT(*) AS total
from olympic
where country='India'
group by year
order by year;


--- Gold Medals won by  India in each year ---

Select year, COUNT(*) AS total
from olympic
where country='India'and
       medal='Gold'
group by year
order by year;

--- silver Medals won by  India in each year ---
Select year, COUNT(*) AS total
from olympic
where country='India'and
       medal='Silver'
group by year
order by year;

----Number of male vs female events----
select event_gender, COUNT(*) 
From olympic
Group by event_gender;

--whether Indian male or female athletes won more medals, ----
Select event_gender, COUNT(*) AS total_medals
From olympic
Where country = 'India'
Group BY event_gender
Order BY total_medals ASC;

---Which Olympic Games have the most medals in history---

SELECT games,COUNT(*) AS total_medals
FROM olympic
GROUP BY games
ORDER BY total_medals DESC         
LIMIT 1; 

--Which Olympic Games India  have the most medals in history---
SELECT games,COUNT(*) AS total_medals
FROM olympic
where country='India'
GROUP BY games
ORDER BY total_medals DESC         
LIMIT 1; 


----Find sport with most medals----

Select sport, COUNT(*) AS total
From  olympic
Group BY sport
Order BY total DESC
Limit 1;

----Which country won the most medals in each year---

Select year, country, COUNT(*) AS total_medals
From olympic
Group BY year, country
Order BY year, total_medals DESC;


---List athletes who won multiple medals----

Select athletes, COUNT(*) AS medals
From olympic
Group BY athletes
Having count(*) > 1
Order BY medals DESC;


---Top sports India won medals in ---

select  sport, count(*) AS medals
From olympic
WHERE country = 'India'
Group BY sport
order BY medals desc;




----Indian athletes who won multiple medals-----
SELECT athletes, COUNT(*) AS medals
FROM olympic
WHERE country = 'India'
GROUP BY athletes
HAVING COUNT(*) > 1
ORDER BY medals DESC;


----India's medals in 2024 Olympics----

SELECT COUNT(*) AS medals_2024
FROM olympic
WHERE country = 'India' AND year = 2024;


