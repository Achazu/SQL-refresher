CREATE DATABASE data_types;
USE data_types;
CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));

INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle');
INSERT INTO dogs (name, breed) VALUES ('Jane', 'Retriever');

SELECT * FROM dogs;

CREATE TABLE items(price DECIMAL(5,2));
INSERT INTO items(price) VALUES(7);
INSERT INTO items(price) VALUES(34.33);
INSERT INTO items(price) VALUES(3324424324);

SELECT * FROM items;

CREATE TABLE thingies (price FLOAT);
INSERT INTO thingies(price) VALUES (88.45);
SELECT * FROM thingies;
INSERT INTO thingies(price) VALUES (8877.45);
SELECT * FROM thingies;
INSERT INTO thingies(price) VALUES (887723142414214.45);

CREATE TABLE people(
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Larry', '1933-11-11', '10:07:35', '1933-11-11 10:07:35');

SELECT * FROM people;

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Microwave', CURDATE(), CURTIME(), NOW());

SELECT * FROM people;

SELECT name, birthdate, DAYNAME(birthdate) FROM people;

SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;

SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;

SELECT * FROM people;

SELECT DATEDIFF(NOW(), birthdate) FROM people;

SELECT birthdt FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 QUARTER) FROM people;

SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

DROP TABLE comments;
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO comments (content) VALUES('lol what a funny article');
 
INSERT INTO comments (content) VALUES('I found this offensive');
 
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
 
SELECT * FROM comments ORDER BY created_at DESC;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
 
INSERT INTO comments2 (content) VALUES('dasdasdasd');
 
INSERT INTO comments2 (content) VALUES('lololololo');
 
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
 
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments2;
 
SELECT * FROM comments2 ORDER BY changed_at;


SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();

SELECT DAYNAME(CURDATE());
SELECT DATE_FORMAT(CURDATE(), '%w');
SELECT DATE_FORMAT(CURDATE(), '%W');
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

CREATE TABLE tweets (
	content CHAR(20),
    username VARCHAR(50),
    post_time TIMESTAMP DEFAULT NOW()
);

DESC tweets;

CREATE TABLE inventory (
	item_name VARCHAR(50),
    price DECIMAL(6,2),
    quantity INT
);

INSERT INTO tweets (content, username) VALUES ('first tweet', 'Luke');

SELECT * FROM tweets;