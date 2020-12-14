-- Outcomes with each player batting (CASE STATEMENT)
SELECT match_id, team_id, innings, player_id, runs, balls,
CASE WHEN runs= 0 THEN 'Duck!'
WHEN runs BETWEEN 50 AND 100 THEN 'Half Century'
WHEN runs BETWEEN 100 AND 200 THEN 'Century'
WHEN runs>= 200 THEN 'Double Century'
WHEN runs IS NULL THEN 'Did not bat'
ELSE 'Howzat!' END AS outcome
FROM matchruns

--Total number of runs made in the tournament so far
SELECT 
CASE WHEN team_id = 1 THEN 'Australia'
ELSE 'India'
END AS team,
SUM(runs) AS total_runs
FROM matchruns
GROUP BY team
ORDER BY total_runs DESC

SELECT match_id, t.name, p.name, runs, balls, fours, sixes,
CASE WHEN wicket_id = 1 THEN 'Bowled him!'
WHEN wicket_id = 2 THEN 'What a catch'
WHEN wicket_id = 3 THEN 'Howzat?!'
WHEN wicket_id = 5 THEN 'Stumped!'
ELSE 'NOT OUT' END AS wickets
FROM matchruns m
JOIN teams t
ON m.team_id = t.id
JOIN players p
ON m.player_id = p.id

