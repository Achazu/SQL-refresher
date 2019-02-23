SELECT * FROM books;

SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;

SELECT title FROM books WHERE title LIKE '%the%';
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

SELECT @@GLOBAL.sql_mode;
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT min(released_year) FROM books;
SELECT MAX(released_year) FROM books;

SELECT title FROM books

SELECT * FROM books WHERE pages = (SELECT min(pages) FROM books);

SELECT * FROM books ORDER BY pages ASC LIMIT 1;



SELECT released_year, CONCAT(author_fname, ' ', author_lname) FROM books GROUP BY CONCAT(author_fname, ' ', author_lname) ORDER BY released_year ASC;

SELECT author_fname, author_lname, Min(released_year) FROM books GROUP BY author_lname, author_fname;

SELECT author_fname, author_lname, Max(pages) FROM books GROUP BY author_lname, author_fname;

SELECT author_lname, author_fname, Sum(pages) FROM books GROUP BY author_lname, author_fname;

SELECT author_lname, author_fname, AVG(pages) FROM books GROUP BY author_lname, author_fname;

SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year ORDER BY released_year DESC;

SELECT COUNT(*) FROM books;


SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) FROM books;

SELECT CONCAT(author_fname, ' ', author_lname), pages FROM  books GROUP BY CONCAT(author_fname, ' ', author_lname) ORDER BY pages DESC LIMIT 1;

SELECT * FROM BOOKS;

SELECT released_year AS 'year', COUNT(*) AS '#books', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year;
