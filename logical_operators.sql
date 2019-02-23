USE book_shop;

SELECT title, released_year FROM books WHERE released_year != 2017;

SELECT title FROM books WHERE title LIKE '%W%';

SELECT title FROM books WHERE title NOT LIKE '%W%';

SELECT * FROM books;

SELECT * FROM books WHERE released_year > 2000 ORDER BY released_year;
SELECT * FROM books WHERE released_year >= 2000 ORDER BY released_year;
SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;

SELECT * FROM books WHERE released_year > 2010 && author_lname = 'Eggers';

SELECT 2 < 5 && 7 = 9;

SELECT * FROM books WHERE author_lname = 'Eggers' || released_year > 2010 OR stock_quantity > 100;

SELECT CAST('2017-05-02' AS DATETIME);

SHOW databases;

CREATE DATABASE new_testing_db;
USE new_testing_db;
CREATE TABLE people(
	name VARCHAR(50),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);
INSERT INTO people(name, birthdate, birthtime, birthdt) 
VALUES 
('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35'),
('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42'),
('Toaster', '2017-04-21', '19:12:43', '2017-04-21 19:12:43');

SELECT * FROM people;

SELECT name, birthdt FROM people WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);

SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);
    
    USE book_shop;
    
    SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
    SELECT title, author_lname, released_year FROM books WHERE released_year NOT IN (2000, 2002, 2004);
    
      SELECT title, author_lname, released_year FROM books WHERE released_year > 2000 AND released_year % 2 != 0;
      
      SELECT title, released_year,
		CASE
			WHEN released_year >= 2000 THEN 'Modern lit'
            ELSE '20th century lit'
		END AS 'Genre'
		FROM books;
        
        ZADANIA
        
	SELECT * FROM books WHERE released_year > 1980;
    SELECT * FROM books WHERE author_lname = 'Eggers' || author_lname = 'Chabon';
    SELECT * FROM books WHERE author_lname IN ('Eggers', 'Chabon');
    SELECT * FROM books WHERE released_year > 2000 && author_lname = 'Lahiri';
    SELECT * FROM books WHERE pages BETWEEN 100 AND 200;
    SELECT * FROM books WHERE author_lname BETWEEN 100 AND 200;
    SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%' ;
    SELECT * FROM books WHERE SUBSTR(author_lname, 1,1) = 'C' OR
														   SUBSTR(author_lname, 1,1) = 'S' ;
    
    SELECT title, author_lname,
		CASE 
			WHEN title IN ('Just Kids', 'A heartbreaking Work') THEN 'Memoir'
			WHEN title LIKE ('%stories%') THEN 'Short Stories'
            ELSE 'Novel'
		END AS Type
	FROM books;
    
	SELECT author_lname, 
		CASE
			WHEN COUNT(*) = 1 THEN '1 book'
			ELSE CONCAT(COUNT(*), ' books') 
		END AS COUNT
    FROM books 
    GROUP BY author_lname, author_fname;
    