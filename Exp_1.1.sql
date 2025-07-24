CREATE DATABASE AUTHBOOK;
USE AUTHBOOK;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    country VARCHAR(100)
);
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

INSERT INTO Authors (author_id, author_name, country) 
VALUES
(1, 'J.K. Rowling', 'United Kingdom'),
(2, 'George R.R. Martin', 'United States'),
(3, 'Haruki Murakami', 'Japan');

INSERT INTO Books (book_id, title, author_id) 
VALUES
(101, 'Harry Potter and the Philosopher\'s Stone', 1),
(102, 'A Game of Thrones', 2),
(103, 'Norwegian Wood', 3);

SELECT 
    Books.title AS book_title,
    Authors.author_name,
    Authors.country
FROM 
    Books
INNER JOIN 
    Authors ON Books.author_id = Authors.author_id;
