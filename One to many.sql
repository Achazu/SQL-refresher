DROP TABLE customers;
DROP TABLE orders;

CREATE database relationships;
USE relationships;
CREATE TABLE customers(
id INT AUTO_INCREMENT PRIMARY KEY, 
first_name VARCHAR(100),
last_name VARCHAR(100),
email VARCHAR(100)
);
CREATE TABLE orders(
id INT AUTO_INCREMENT PRIMARY KEY,
order_date DATE, 
amount DECIMAL(8, 2),
customer_id INT, 
FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers(first_name, last_name, email) VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders(order_date, amount, customer_id) VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
SELECT * FROM orders;
SELECT * FROM customers;

SELECT * FROM orders WHERE customer_id =
(
	SELECT id FROM customers WHERE last_name = 'George'
);
-- Implicit join
SELECT first_name, last_name, order_date, amount FROM customers, orders WHERE customers.id = orders.customer_id;
-- explicit join
SELECT * FROM customers
JOIN orders
	ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount 
FROM orders 
JOIN customers 
	ON orders.customer_id = customers.id
GROUP BY orders.customer_id
ORDER BY amount DESC LIMIT 1;

SELECT * FROM customers 
LEFT JOIN orders
	ON customers.id = orders.customer_id;
    
SELECT 
	first_name, 
	last_name,
    IFNULL(SUM(amount), 0)
FROM customers
LEFT JOIN orders
	ON customers.id = orders.customer_id
GROUP BY customers.id;
    
    DELETE FROM customers WHERE first_name = 'Boy';
    
-- !!!!
-- ZADANIA
-- !!!
DROP TABLE papers;

CREATE TABLE students(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(100)
);

CREATE TABLE papers(
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100),
grade INT,
student_id INT,
FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;
SELECT * FROM papers;

SELECT first_name, title, grade FROM students 
JOIN papers
ON students.id = papers.student_id
ORDER BY grade DESC;

SELECT first_name, title, grade FROM students 
LEFT JOIN papers
ON students.id = papers.student_id;

SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0) FROM students 
LEFT JOIN papers
ON students.id = papers.student_id;

SELECT first_name, IFNULL(avg(grade), 0) AS average
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

SELECT first_name, Ifnull(Avg(grade), 0) AS average, 
   CASE 
         WHEN Avg(grade) IS NULL THEN 'FAILING' 
         WHEN Avg(grade) >= 75 THEN 'PASSING' 
         ELSE 'FAILING' 
       end AS passing_status 
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY students.id 
ORDER BY average DESC;

