--StrikeRates for each player 
SELECT p.name, (SUM(runs)/NULLIF(SUM(balls), 0.0)* 100) AS SR
FROM matchruns m
JOIN players p
ON m.player_id = p.id
WHERE runs IS NOT NULL
AND runs != 0
GROUP BY p.name
ORDER BY SR DESC

--Number of Player of the Match Awards
SELECT p.name playerofthematch, COUNT(*)
FROM match
JOIN players AS p
ON match.potm = p.id
GROUP BY p.name
ORDER BY COUNT(*) DESC

SELECT p.name, SUM(fours + sixes) AS boundaries
FROM matchruns m
JOIN players p
ON m.player_id = p.id
WHERE fours IS NOT NULL
AND sixes IS NOT NULL
GROUP BY match_id, p.name, innings
ORDER BY boundaries DESC
