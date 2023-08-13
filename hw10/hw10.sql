CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT parents.child
  FROM parents
  JOIN dogs ON parents.parent = dogs.name
  ORDER BY dogs.height DESC;

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size
  FROM dogs d
  JOIN sizes s ON d.height > s.min AND d.height <= s.max;


-- Filling out this helper table is optional
-- CREATE TABLE siblings AS

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT 
      'The two siblings, ' || s1.name || ' plus ' || s2.name || ' have the same size: ' || s1.size as sibling_description
  FROM
      (SELECT p1.child as sibling1, p2.child as sibling2
      FROM parents p1
      JOIN parents p2 ON p1.parent = p2.parent
      WHERE p1.child < p2.child) as siblings
  JOIN size_of_dogs s1 ON siblings.sibling1 = s1.name
  JOIN size_of_dogs s2 ON siblings.sibling2 = s2.name
  WHERE s1.size = s2.size;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, MAX(height) - MIN(height)
  FROM dogs d
  GROUP BY fur
  HAVING MIN(height) > 0.7 * AVG(height) AND MAX(height) < 1.3 * AVG(height);
