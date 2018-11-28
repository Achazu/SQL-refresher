CREATE DATABASE book_shop;
USE book_shop;
show tables;

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
    
DESC books;

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * FROM books;
SELECT 
	CONCAT(author_fname, ' ', author_lname) AS 'full name'
FROM books;

SELECT 
	CONCAT_WS(' - ', title, author_fname, author_lname) AS colName
FROM books;

SELECT SUBSTRING('Hello World', 1, 4);
SELECT SUBSTRING(title, 1, 6) AS shortTitle FROM books;

SELECT 
	CONCAT(
		SUBSTRING(title, 1, 6), 
        '...'
        ) AS titleCode 
FROM books;

SELECT REPLACE ('Hello World', 'Hell', '!@#$'); 
SELECT REPLACE ('Hello WOrld', 'o', '?');
SELECT REPLACE ('Hello World', 'l', 'X');

SELECT
	REPLACE(title, 'e', '3') FROM books;
    
SELECT * FROM books;

SELECT
	SUBSTRING
		(
			REPLACE(title, 'e', '3'),
            1,
            10
		)
FROM books; 

SELECT CONCAT('woof', REVERSE('woof'));

SELECT author_fname, CHARACTER_LENGTH(author_fname) FROM books;

SELECT CONCAT
	(
    author_fname, ' is ', 
	CHARACTER_LENGTH(author_fname), 
    ' characters long'
    ) 
FROM books;

SELECT CONCAT('MY FAVOURITE BOOK IS', UPPER(title)) FROM books;

SELECT UPPER(REVERSE('Why does my cat look at me with such haterd'));

SELECT REPLACE(title, ' ', '->') AS 'title' FROM books;

SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;

SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;

SELECT title AS title, CHARACTER_LENGTH(title) AS 'character length' FROM books;

SELECT CONCAT(SUBSTRING(title, 1, 10),'...') AS 'ashort title', CONCAT(author_lname, ',', author_fname) AS 'author', CONCAT(stock_quantity, ' in stock') FROM books;
