DROP TABLE cost_path;


CREATE TABLE cost_path ( 
	point1 varchar NOT NULL,
  	point2 varchar NOT NULL,
    cost int NOT NULL 
);


INSERT INTO cost_path
VALUES ('a','b',10), ('b','a',10),
       ('b','c',35), ('c','b',35),
       ('c','a',15), ('a','c',15),
       ('c','d',30), ('d','c',30),
       ('a','d',20), ('d','a',20),
       ('b','d',25), ('d','b',25);


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
    JOIN cost_path ON nodes.point2 = cost_path.point1
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
ORDER BY total_cost, tour;
