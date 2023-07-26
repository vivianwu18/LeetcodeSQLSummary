WITH tmp AS (
    SELECT match_id, host_team, guest_team,
    CASE WHEN host_goals = guest_goals THEN 1
    WHEN host_goals > guest_goals THEN 3
    ELSE 0 END AS host_score, 
    CASE WHEN host_goals = guest_goals THEN 1
    WHEN host_goals < guest_goals THEN 3
    ELSE 0 END AS guest_score
    FROM Matches
), tmp2 AS (
    SELECT Teams.team_id, Teams.team_name, host_score AS num_points
    FROM Teams 
    LEFT JOIN tmp ON tmp.host_team = Teams.team_id
    UNION ALL
    SELECT Teams.team_id, Teams.team_name, guest_score
    FROM Teams
    LEFT JOIN tmp ON tmp.guest_team = Teams.team_id)
SELECT team_id, team_name, ISNULL(SUM(num_points), 0) AS num_points
FROM tmp2
GROUP BY team_id, team_name
ORDER BY 3 DESC, 1;