CREATE DATABASE project;
USE project;
CREATE TABLE cats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  ); 
  

INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
DESC cats;

show databases;

SELECT * FROM cats;
SELECT name FROM cats;
SELECT age FROM cats;
SELECT cat_id, age, name, breed FROM cats;
SELECT cat_id FROM cats;
SELECT name, breed FROM cats;

SELECT * FROM cats WHERE age = 4;
SELECT * FROM cats WHERE name = 'EGG';

SELECT * FROM cats WHERE name = 'egG';
SELECT name, age FROM cats WHERE breed = 'TAbBy';
SELECT cat_id, age FROM cats WHERE cat_id = age;

SELECT cat_id AS 'ID', name AS 'CatName' FROM cats;

DESC cats;

UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
UPDATE cats SET age=14 WHERE name='Misty';

SELECT * FROM cats;

UPDATE cats SET name='Jack' WHERE name='Jackson';
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
UPDATE cats SET age=12 WHERE breed='maine coon';

SELECT * FROM cats;
DELETE FROM cats WHERE name='egg';

DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE age=cat_id;
DELETE FROM cats;

CREATE DATABASE shirts_db;
USE shirts_db;
CREATE TABLE shirts(
shirt_id INT AUTO_INCREMENT NOT NULL,
article VARCHAR(50) NOT NULL, 
color VARCHAR(50) NOT NULL,
shirt_size VARCHAR(50) NOT NULL, 
last_worn INT NOT NULL, 
PRIMARY KEY (shirt_id)
);

DESC shirts;

INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES
 ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
SELECT * FROM shirts;

INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES ('Polo Shirt', 'Purple', 'M', 50);

SELECT article, color FROM shirts;
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = 'm';

UPDATE shirts SET shirt_size = 'L' WHERE article = 'polo shirt';
UPDATE shirts SET last_worn = 0 WHERE last_worn = 15;

UPDATE shirts SET color = 'off white', shirt_size = 'XS' WHERE color='white';

DELETE FROM shirts WHERE last_worn = 200;
DELETE FROM shirts WHERE article = 'tank top';
DELETE FROM shirts;
DROP TABLE shirts;