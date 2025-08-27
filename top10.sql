-- Top teams by wins (2023) INCLUDING TIES at the 10th rank
WITH wins AS (
  SELECT
    t.team_id,
    t.team_name,
    COUNT(*) AS wins
  FROM matches m
  JOIN teams t
    ON t.team_id = m.winner_team_id
  WHERE m.season = 2023
  GROUP BY t.team_id, t.team_name
),
ranked AS (
  SELECT
    wins.*,
    DENSE_RANK() OVER (ORDER BY wins.wins DESC) AS rnk
  FROM wins
)
SELECT
  team_id,
  team_name,
  wins
FROM ranked
WHERE rnk <= 10
ORDER BY wins DESC, team_name;
