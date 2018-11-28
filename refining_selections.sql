INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

select database();

SELECT title FROM books;

SELECT DISTINCT author_lname FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT released_year FROM books ORDER BY released_year;

SELECT title, pages FROM books ORDER BY released_year;

SELECT title, author_fname, author_lname FROM books ORDER BY 2; 

SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;

USE book_shop;

SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
SELECT title, author_fname FROM books WHERE author_fname LIKE 'dA%';
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da';
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
SELECT title FROM books WHERE title LIKE '%\_%';

SELECT title FROM books AS title WHERE title LIKE '%stories%' ;

SELECT title AS title, pages AS pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title AS title, author_lname AS author_lname FROM books WHERE author_lname LIKE '% %';

SELECT title AS title, released_year AS released_year, stock_quantity AS stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

SELECT title AS title, author_lname AS author_lname FROM books ORDER BY author_lname, title;

SELECT UPPER(CONCAT('my favourite author is ', author_fname, ' ', author_lname, '!')) AS yell FROM books ORDER BY author_lname;

SELECT * FROM books;

SELECT COUNT(DISTINCT author_lname) FROM books;