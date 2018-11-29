SELECT * FROM books;

SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;

SELECT title FROM books WHERE title LIKE '%the%';
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;

SELECT @@GLOBAL.sql_mode;
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';