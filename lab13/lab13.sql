.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet 
  FROM students 
  WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song 
  FROM students 
  WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE smallest_int_having AS
  SELECT time, smallest
  FROM students 
  GROUP BY smallest 
  HAVING COUNT(*) = 1;

CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color
  FROM students a
  JOIN students b ON a.pet = b.pet AND a.song = b.song
  WHERE a.time < b.time;

CREATE TABLE sevens AS
  SELECT s.seven
  FROM students s
  JOIN numbers n ON s.time = n.time
  WHERE s.number = 7 AND n.'7' = 'True';

CREATE TABLE average_prices AS
  SELECT category, AVG(msrp) as average_price 
  FROM products 
  GROUP BY category;

CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price)
  FROM inventory
  GROUP BY item;


CREATE TABLE shopping_list AS
  SELECT name, store
  FROM products p
  JOIN lowest_prices l ON p.name = l.item
  GROUP BY category
  HAVING MIN(msrp/rating);

CREATE TABLE total_bandwidth AS
  SELECT SUM(s.mbs)
  FROM stores s
  JOIN shopping_list sl ON s.store = sl.store; 

