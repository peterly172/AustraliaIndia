--Rankings of Players scored the most runs in the series
SELECT p.name AS player, SUM(runs),
RANK() OVER(ORDER BY SUM(runs)DESC) AS total_runs
FROM matchruns AS m
JOIN players AS p
ON m.player_id = p.id
WHERE runs IS NOT NULL
GROUP BY p.name
ORDER BY total_runs

--Number of balls bowled by each venue
SELECT v.name, SUM(balls) AS total_balls,
RANK() OVER(ORDER BY SUM(balls)DESC) AS runs
FROM matchruns AS m
LEFT JOIN match
ON m.match_id = match.id
LEFT JOIN venues AS v
ON match.venue_id = v.id
GROUP BY v.name

--Number of boundaries made by each player in ranking
SELECT p.name, SUM(fours + sixes) AS total_boundaries,
RANK() OVER(ORDER BY SUM(fours + sixes)DESC) AS boundaries
FROM matchruns m
JOIN players p
ON m.player_id = p.id
WHERE runs IS NOT NULL
GROUP BY p.name


