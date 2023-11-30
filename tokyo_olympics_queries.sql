-- Count the number of athletes from each country:
SELECT Country, COUNT(*) AS TotalAthletes
FROM athletes
GROUP BY Country
ORDER BY TotalAthletes DESC;

-- Calculate the total medals won by each country:
SELECT 
Team_Country,
SUM(Gold) Total_Gold,
SUM(Silver) Total_Silver,
SUM(Bronze) Total_Bronze
FROM medals
GROUP BY Team_Country
ORDER BY Total_Gold DESC;

-- Calculate the average number of entries by gender for each discipline:
SELECT 
Discipline,
AVG(Female) Avg_Female,
AVG(Male) Avg_Male
FROM entriesgender
GROUP BY Discipline;

-- Top 5 countries with the most gold medals:
SELECT TOP 5
    Team_Country,
    SUM(Gold) AS Total_Gold
FROM medals
GROUP BY Team_Country
ORDER BY Total_Gold DESC;

-- Count the number of disciplines (competitions) entered for each country:
SELECT
    Country,
    COUNT(DISTINCT Discipline) AS UniqueDisciplines
FROM teams
GROUP BY Country
ORDER BY UniqueDisciplines DESC;

-- Count the number of coaches for each country:
SELECT
    Country,
    COUNT(*) AS TotalCoaches
FROM coaches
GROUP BY Country
ORDER BY TotalCoaches DESC;

-- Identify any athletes competing in more than one discipline:
SELECT
    PersonName,
    Country,
    COUNT(DISTINCT Discipline) AS UniqueDisciplines,
    STRING_AGG(Discipline, ', ') AS CompetingDisciplines
FROM athletes
GROUP BY PersonName, Country
HAVING COUNT(DISTINCT Discipline) > 1
ORDER BY UniqueDisciplines DESC;
