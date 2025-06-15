WITH RECURSIVE nodes AS (
  SELECT point1 AS path,
    point1, point2, cost
  FROM cost_path
  WHERE point1 = 'a'
  UNION
  SELECT CONCAT(nodes.path, ',', cost_path.point1) AS path,
    cost_path.point1, cost_path.point2,
    nodes.cost + cost_path.cost
  FROM nodes
    JOIN cost_path
    ON nodes.point2 = cost_path.point1
  WHERE path NOT LIKE CONCAT('%', cost_path.point1, '%')
  ), routes AS (
  SELECT cost AS total_cost,
    CONCAT('{', path, ',', point2, '}') AS tour
  FROM nodes
  WHERE LENGTH(path) = 7 AND point2 = 'a'
)
SELECT *
FROM routes
WHERE total_cost = (
  SELECT MIN(total_cost)
  FROM routes
)
UNION ALL
SELECT *
FROM routes
WHERE total_cost = (
  SELECT MAX(total_cost)
  FROM routes
)
ORDER BY total_cost, tour;
	   